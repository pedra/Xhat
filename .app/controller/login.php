<?php

namespace Controller;
use Model;
use Lib;
use Lib\Qzumba as Q;
use Lib\Doc as Doc;

class Login extends Qcontroller {

    function main(){
        $d = new Doc('login');
        //$d->sendCache(); // uncomment in production mode
        $d->val('title', 'Zumbi :: Login')
          ->jsvar('key', str_replace(array("\r",
                                 "\n",
                                 "-----BEGIN PUBLIC KEY-----",
                                 "-----END PUBLIC KEY-----"),
                              '',
                              file_get_contents(ROOT.'.app/config/public.key')))
          ->jsvar('wsUri', 'ws://localhost:8080')
          ->insertStyles(['reset','style'])
          ->insertScripts(['lib/aes','lib/jszip','lib/lib','lib/rsa','lib/jsbn','lib/xhat','main'])
          ->render()
          ->send();
    }

    // decode RSA and LOGIN
    function checkUser($rec){

        $rec = $this->_decodePostData();

        $private = file_get_contents(ROOT.'.app/config/private.key');

        $key = base64_decode($rec['data']->key);

        if(!openssl_private_decrypt($key, $key, openssl_pkey_get_private($private))) {
            exit();

        } else {

            $key = json_decode($key);
            $this->key = $key->asskey; // global key access in this controller

            //login in parent app
            $sys = new Model\Sysuser();
            $user = $sys->getLogin($key->login, $key->password);

            if($user === false) exit(json_encode(['ret'=>'no']));

            //create new user (delete if exists)
            $zumbi = new Model\zumbi();
            $zumbi->createUser($user->ID, $user->NAME, $this->key);

            //user x group status
            $ugs = $zumbi->getUserGroupStatus($user->ID);
            $user = array_merge(['ID'=>$user->ID, 'NAME'=>$user->NAME], $ugs);

            //send
            $this->_sendEncriptedData($user);
        }
    }
}