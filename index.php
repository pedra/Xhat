<?php

// Constants
//define('URL', 'http://54.149.118.130/');
define('QMODE', 'dev'); // options: dev & pro
define('ROOT', str_replace('\\', '/', strpos(__DIR__, 'phar://') !== false
                    ? dirname(str_replace('phar://', '', __DIR__)).'/'
                    : __DIR__.'/'));
define('RPHAR', (strpos(ROOT, 'phar://') !== false) ? ROOT : false);

// Add utils
include ROOT.'.app/config/init.php';
include ROOT.'.app/lib/functions.php';

// Error/Exception set
set_error_handler("errorHandler");
set_exception_handler('exceptionHandler');

// AUTOLOAD
set_include_path(ROOT.PATH_SEPARATOR.get_include_path());
spl_autoload_register(function($class) {
    $class = ROOT.'.app/' . str_replace('\\', '/', trim(strtolower($class), '\\')) . '.php';
    return (($file = _file_exists($class)) !== false ? require_once $file : false);
});

// Composer
//include QAPP.'vendor/autoloader.php';

// Mount the Q static dock
class_alias('Lib\Qzumba', 'Lib\Q');
Lib\Q::mount($config);

// Inserting Access data [optional in developer mode]
Lib\Q::model('access', new Model\Access)->userAccess();

// Install DataBase
//$result = Lib\Q::db()->query(file_get_contents(ROOT.'.app/config/install.sql'));

// Router to controller
Lib\Q::runController();