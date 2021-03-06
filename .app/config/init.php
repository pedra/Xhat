<?php

// Defaults
error_reporting(E_ALL ^ E_STRICT);
setlocale (LC_ALL, 'pt_BR');
date_default_timezone_set('America/Sao_Paulo');

//Config
$config = [
    'db' => ['mysql'=>[
                'dsn'=>'mysql:host=localhost;dbname=zumbi;charset=utf8',
                'user'=>'zumbi',
                'passw'=>'zumbi#123456'
                ],
            'sysuser'=>[
                'dsn'=>'mysql:host=localhost;dbname=zumbi;charset=utf8',
                'user'=>'zumbi',
                'passw'=>'zumbi#123456'
                ]
            ],
    'router'=> ['default'       =>['ctrl'=>'user',      'method'=>'get'],
                'msg'           =>['ctrl'=>'msg',       'method'=>'post'],
                'sendmail'      =>['ctrl'=>'sendmail',  'method'=>'post'],
                'user'         =>['ctrl'=>'user',       'method'=>'post'],
                'upfile'        =>['ctrl'=>'upfile',    'method'=>'post']
        ]
    ];