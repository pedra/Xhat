<?php

//Style
echo '<style>body{font-family:Sans-serif;color:#900;font-size:.9em;max-width:500px;margin:10% auto 30% auto; padding:20px;border-radius:15px;border:1px solid #890;box-shadow:0 10px 20px #999}h1{font-size:5em;margin:0 0 10px 0}</style>';

// Constants
define('ROOT', str_replace('\\', '/', strpos(__DIR__, 'phar://') !== false
                    ? dirname(str_replace('phar://', '', __DIR__)).'/'
                    : __DIR__.'/'));
define('RPHAR', (strpos(ROOT, 'phar://') !== false) ? ROOT : false);
define('URL', $url = 'http://'.$_SERVER['HTTP_HOST'].str_replace(basename(__FILE__), '',$_SERVER['REQUEST_URI']));


// Defaults
error_reporting(E_ALL ^ E_STRICT);
setlocale (LC_ALL, 'pt_BR');
date_default_timezone_set('America/Sao_Paulo');

// Error/Exception set
set_exception_handler('exception');

//Include DB
include ROOT.'.app/lib/db.php';

// Data base configuration
$db = new Lib\Db([
                'dsn'=>'mysql:host=localhost;charset=utf8',
                'user'=>'root',
                'passw'=>'root#123456'
                ]);

//Runing ...
$r = $db->query(file_get_contents(ROOT.'.app/config/install.sql'));

//Success:
exit('<h1>Sucesso!</h1><p>Instalação terminada!!</p><p>Agora, exclua o arquivo de instalação <i>('.__FILE__.')</i><br>antes de acessar o site (<a href="'.URL.'">'.URL.'</a>)</p>');

//Data base exception
function exception($e) {
    if(get_class($e) == 'PDOException')
        exit('<h1>Oops!!</h1>'.$e->getMessage().'<br><br><b>Verifique a configuração de acesso ao banco de dados</b><br>Indique um usuário (root?!) que tenha permissão para criar banco de dados, tabelas, etc.<br><br><i>Obs: configuração na linha <b>26</b> do arquivo </i>'.__FILE__);
}