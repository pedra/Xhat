<?php

namespace Model;
use Lib\Q;


class Access {

    function userAccess(){
        // Pegando dados de ACESSO do cliente
        Q::db()->query('INSERT INTO access (REQUEST,METHOD,REMOTE,AGENT,ACCEPT,ENCODING,LANGUAGE,IDATE)
                            VALUES (:req,:met,:rem,:age,:acc,:enc,:lan,:idate)',
                            [':req'=>$_SERVER['REQUEST_URI'],
                             ':met'=>$_SERVER['REQUEST_METHOD'],
                             ':rem'=>$_SERVER['REMOTE_ADDR'],
                             ':age'=>$_SERVER['HTTP_USER_AGENT'],
                             ':acc'=>$_SERVER['HTTP_ACCEPT'],
                             ':enc'=>$_SERVER['HTTP_ACCEPT_ENCODING'],
                             ':lan'=>$_SERVER['HTTP_ACCEPT_LANGUAGE'],
                             ':idate'=>date('Y-m-d H:I:s')]);
        Q::db()->query('DELETE FROM access WHERE DATE(access.IDATE) <= DATE(DATE(NOW())-30)');
    }


}