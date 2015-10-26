<?php

namespace Controller;
use Model;
use Lib;
use Lib\Qzumba as Q;
use Lib\Doc as Doc;

class Msg extends Qcontroller {

    function getMsgByGroup(){
        $e = $this->_decodePostData();
        if($e === false) exit();
        //Send data
        $this->_sendEncriptedData($this->model->msgByUserGroup($e['data']->id, $e['dec']->group));
    }

    function getUserGroupStatus(){
        $e = $this->_decodePostData();
        if($e === false) exit();
        //Send data
        $this->_sendEncriptedData($this->model->getUserGroupStatus($e['data']->id));
    }

}