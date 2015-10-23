<?php

namespace Model;
use Lib;


class Relay {

    private $db = null;
    private $id = null;

    function __construct($config) {
        $this->db = new Lib\Db($config);
    }

    function initalize($owner, $host, $port){

        //DB insert
        $this->db->query('INSERT INTO relay (PID,STATUS,SCRIPT,OWNER,IP,PORT,CHA_NOW,CHA_MAX,US_NOW,US_MAX,ERRORS,START,LAST_UPDATE)
                                  VALUES (:pid,1,:script,:owner,:ip,:port,0,0,0,0,0,:st,:end)',
                                  [':pid'=>getmypid(),
                                   ':script'=>__FILE__,
                                   ':owner'=>$owner,
                                   ':ip'=>$host,
                                   ':port'=>$port,
                                   ':st'=>date('Y-m-d H:i:s'),
                                   ':end'=>date('Y-m-d H:i:s')]);
        //pegando ID
        $this->db->query('SELECT MAX(ID)ID FROM relay WHERE PID = '.getmypid());
        $this->id = isset($this->db->result()[0]->ID) ? $this->db->result()[0]->ID : null;
    }

    //Verifica se o status foi modificado para 2 [parar]
    function stop(){
        $this->db->query('SELECT STATUS FROM relay WHERE ID = '.$this->id);
        $tmp = $this->db->result();

        //parando se for solicitado (STATUS = 2)
        if(isset($tmp[0]) && $tmp[0]->STATUS == 2) return true;
        return false;
    }

    //update data
    function theUpdate($us_now, $us_max, $cha_now, $cha_max, $end = false){

        $this->db->query('UPDATE relay
                    SET LAST_UPDATE = :lud,'.
                    ($end === false ? '' : ' STATUS = 0,').'
                        US_NOW = :un,
                        US_MAX = :um,
                        CHA_NOW = :cn,
                        CHA_MAX = :cm
                    WHERE ID = :id',
                    [':lud'=>date('Y-m-d H:i:s'),
                     ':un'=>$us_now,
                     ':um'=>$us_max,
                     ':cn'=>$cha_now,
                     ':cm'=>$cha_max,
                     ':id'=>$this->id]
                );
    }

    function channelExists($user, $channel){
        $this->db->query('SELECT *
                     FROM groups, user_group
                     WHERE ID = :ch
                     AND IDUSER = :us
                     AND STATUS = 1
                     AND ID = IDGROUP', [':ch'=>$channel, ':us'=>$user]);
        $rs = $this->db->result();
        if($rs === false) return false;
        $rs = $rs[0];
        return ['name'=>$rs->NAME,
                'id'=>$rs->ID,
                'about'=>$rs->ABOUT];
    }

    function decMSG($msg){

        if(!isset($msg->id)) return false;

        //get key
        $this->db->query('SELECT * FROM users WHERE ID = :id',[':id'=>$msg->id]);
        $rs = $this->db->result();
        if($rs === false) return false;

        $rs = $rs[0];
        Lib\Aes::size(256);
        $dec = Lib\Aes::dec($msg->msg, $rs->SKEY);

        if(!$dec) return false;

        $ret = json_decode($dec);
        $ret->name = $rs->NAME;
        $ret->userid = $rs->ID;
        return $ret;
    }


    function encMSG($msg, $id){
        //get key
        $this->db->query('SELECT * FROM users WHERE ID = :id',[':id'=>$id]);
        $rs = $this->db->result();
        if($rs === false) return false;

        //encryt
        Lib\Aes::size(256);
        return Lib\Aes::enc($msg, $rs[0]->SKEY);
    }

    function saveMSG($msg){
        $this->db->query('INSERT INTO messages (SENDDATE, IDFROM, NAMEFROM, TOGROUP, TOUSER, TYPE, CONTENT)
                                    VALUES (:sd, :idf, :nmf, :tg, :tu, :tp, :ct)',
                                    [':sd'=>date('Y-m-d H:i:s'),
                                     ':idf'=>$msg->userid,
                                     ':nmf'=>$msg->name,
                                     ':tg'=>$msg->channel,
                                     ':tu'=>0,
                                     ':tp'=>$msg->type,
                                     ':ct'=>$msg->message]);
    }
}