<?php

namespace Model;
use Lib\Q;


class Admin {

    //Lista todos os 'relays' agrupado por nome (TITLE)
    function getRelay(){
        Q::db()->query('SELECT *
                        FROM relay
                        GROUP BY TITLE
                        ORDER BY LAST_UPDATE');
        return Q::db()->result();
    }
    // ------------------------------------------------------------------------------------------------------
    // TODO ---- os metodos abaixo foram copiados - eliminar(?)

    function createUser($id, $name, $skey){

        $this->deleteUser($id);
        //INSERT
        Q::db()->query('INSERT INTO `users`
                    (`ID`, `NAME`, `SKEY`)
                    VALUES (:id, :name, :skey)',
                        [
                        ':id'=>$id,
                        ':name'=>$name,
                        ':skey'=>$skey
                        ]);
        return Q::db()->result();

    }

    function deleteUser($id){
        Q::db()->query('DELETE FROM `users` WHERE ID = :id', [':id'=>$id]);
        return Q::db()->result();
    }

    //Pega os grupos habilitados para um determinado usuário
    function getUserGroupStatus($user){

        Q::db()->query('SELECT  user_group.LASTMSG LASTMSG,
                                user_group.LASTDATE,
                                groups.ID GID,
                                groups.PAR,
                                groups.NAME,
                                groups.ABOUT,
                                (SELECT COUNT(ID) FROM messages WHERE TOGROUP = GID AND ID > LASTMSG) MSG,
                                (SELECT COUNT(ID) FROM messages WHERE TOGROUP = GID) TOTAL
                        FROM user_group, users, groups
                        WHERE user_group.IDUSER = :user
                        AND   users.ID = user_group.IDUSER
                        AND   groups.ID = user_group.IDGROUP
                        ORDER BY groups.PAR desc
                        ', [':user'=>$user]);
        $ret = Q::db()->result();
        if($ret === false) return [];

        //formatando os dados ...

        $o = [];
        foreach($ret as $k=>$col){
            $id = 0 + $col->GID;
            $par = 0 + $col->PAR;

            $o[$id]['title'] = $col->ABOUT;
            $o[$id]['name'] = $col->NAME;
            $o[$id]['msg'] = 0 + $col->MSG;
            $o[$id]['total'] = 0 + $col->TOTAL;
            $o[$id]['last'] = 0 + $col->LASTMSG;
            $o[$id]['par'] = $par;
        }

        foreach($o as $k=>$a){
            if(isset($o[$a['par']])){
                $o[$a['par']]['content'][$k] = $o[$k];
                unset($o[$k]);
            }
        }

        $x = $this->_getIdPar($o);

        return ['li'=>$x];
    }


    //get user KEY
    function getUserKey($id){
        Q::db()->query('SELECT SKEY FROM users WHERE ID=:id',[':id'=>$id]);
        $rs = Q::db()->result();
        return isset($rs[0]->SKEY) ? $rs[0]->SKEY : false;
    }

    //get Messages from User in Group
    function msgByUserGroup($user, $group){
        Q::db()->query('SELECT *
                          FROM messages
                          WHERE TOGROUP = :grp
                          ORDER BY ID desc
                          LIMIT 10', [':grp'=>$group]);
        $rs = Q::db()->result();
        if($rs === false) return false;

        krsort($rs); //invertendo a ordem do array (vem na ordem inversa para usar LIMIT)

        $o = [];
        foreach($rs as $col){
            $o[$col->ID]['date'] = $col->SENDDATE;
            $o[$col->ID]['id'] = $col->IDFROM;
            $o[$col->ID]['name'] = $col->NAMEFROM;
            $o[$col->ID]['group'] = $col->TOGROUP;
            $o[$col->ID]['user'] = $col->TOUSER;
            $o[$col->ID]['type'] = $col->TYPE;
            $o[$col->ID]['content'] = $col->CONTENT;
        }

        //Atualizando o registro de mensagem
        Q::db()->query('UPDATE user_group
                            SET LASTMSG = :lm
                            WHERE IDUSER = :user
                            AND   IDGROUP = :grp',
                        [':lm'=>$col->ID,
                         ':user'=>$user,
                         ':grp'=>$group]);
        return $o;
    }

    //get connected userlist
    function getUserList(){
        Q::db()->query('SELECT * FROM users');

        $rs = Q::db()->result();
        if($rs === false) return false;

        $o = [];
        foreach ($rs as $col) {
            $o[$col->ID]['id'] = $col->ID;
            $o[$col->ID]['name'] = $col->NAME;
            $o[$col->ID]['last'] = $col->LAST;
        }
        return $o;
    }




    // ------------------- privates -----------------------

    //inserindo sub conteúdos recursivamente
    private function _getIdPar($a){
        foreach($a as $k=>$v){
            $x[$k] = $v;
            if(isset($v['content'])){
                $x[$k]['content'] = $this->_getIdPar($v['content']);
            }
        }
        return $x;
    }





}