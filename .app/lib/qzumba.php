<?php
/**
 * Qzumba framework
 * @copyright   Bill Rocha - http://plus.google.com/+BillRocha
 * @license     MIT & GLP2
 * @author      Bill Rocha - prbr@ymail.com
 * @version     0.0.1
 * @package     Lib
 * @access      public
 * @since       0.0.1
 *
 */

namespace Lib;

class Qzumba {

    static $config  = null;

    static $root    = null;
    static $php     = null;
    static $ctrl    = null;
    static $html    = null;
    static $models   = [];
    static $style   = null;
    static $script  = null;
    static $files   = null;
    static $upload  = null;

    static $url     = null;
    static $rqst    = [];

    static $vars   = [];
    static $db     = [];

    static function url(){return static::$url;}
    static function root(){return static::$root;}
    static function php(){return static::$php;}
    static function inc($file){return include static::$php.$file.'.php';}
    static function ctrl($file){return include static::$ctrl.$file.'.php';}
    static function html(){return static::$html;}
    static function upload(){return static::$upload;}
    static function style(){return static::$style;}
    static function script(){return static::$script;}

    /* Database access point
     *
     *  ex.: Q::db('name', new Lib\Name); -> instancia o objeto com o nome "name"
     *  ex.: Q::db('name'); -> recupera o objeto "name"
     */
    static function db($alias = null, $node = null){
        if($alias === null
            && $node === null
                && count(static::$config['db']) > 0)
                    $alias = array_keys(static::$config['db'])[0]; //pega o primeiro "alias" em config (default)

        if(isset(static::$db[$alias])) return static::$db[$alias];
        if(!isset(static::$config['db'][$alias])) return false; //caso $alias não existir em "config"
        return static::$db[$alias] = new \Lib\Db(static::$config['db'][$alias]); //instancia a classe e retorna
    }

    /* Models root
     *
     *  ex.: Q::model('name', new Model\Name); -> instancia o objeto com o nome "name"
     *  ex.: Q::model('name'); -> recupera o objeto "name"
     */
    static function model($alias, $node = null){
        if(isset(static::$models[$alias])) return static::$models[$alias];
        if($node === null || !is_object($node)) return false;
        return static::$models[$alias] = $node;
    }

    static function rqst($i = null){
        if($i === null) return static::$rqst;
        return isset(static::$rqst[$i]) ? static::$rqst[$i] : null;
    }

    static function val($n, $v = null){
        if($v === null) return static::$vars[$n];
        static::$vars[$n] = $v;
    }

    static function getConfig($item = null){
        if($item !== null && isset(static::$config[$item])) return static::$config[$item];
        else return static::$config;
    }

    static function mount($config){

        static::$config = $config;

        //not configurables
        static::$root =     ROOT;
        static::$php =      ROOT.'.app/';
        static::$ctrl =     ROOT.'.app/controller/';
        static::$html =     ROOT.'.app/html/';
        static::$upload =   ROOT.'.app/upload/';
        static::$style =    ROOT.'css/';
        static::$script =   ROOT.'js/';

        //Detect SSL access
        if (!isset($_SERVER['SERVER_PORT'])) $_SERVER['SERVER_PORT'] = 80;
        $http = (isset($_SERVER['HTTPS'])
                    && ($_SERVER["HTTPS"] == "on"
                        || $_SERVER["HTTPS"] == 1
                        || $_SERVER['SERVER_PORT'] == 443))
                            ? 'https://'
                            : 'http://';

        //What's base??!
        $base = isset($_SERVER['PHAR_SCRIPT_NAME'])
                    ? dirname($_SERVER['PHAR_SCRIPT_NAME'])
                    : rtrim(str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']), ' /');

        if ($_SERVER['SERVER_PORT'] != 80) $base .= ':' . $_SERVER['SERVER_PORT'];

        //URL & REQST Constants:
        defined('RQST') || define('RQST', urldecode(isset($_SERVER['REQUEST_URI'])
                            ? urldecode(trim(str_replace($base, '', trim($_SERVER['REQUEST_URI'])), ' /'))
                            : ''));

        defined('URL') || define('URL', isset($_SERVER['SERVER_NAME']) ? $http . $_SERVER['SERVER_NAME'] . $base . '/' : '');

        static::$url = URL;
        static::$rqst = explode('/', RQST);
        static::$files =    URL.'files/';
    }


    /* Run Controller
     *
     *
     */
    static function runController(){
        $rqst = static::rqst(0);

        if(isset(static::$config['router'][$rqst])
            && strtolower(static::$config['router'][$rqst]['method']) == strtolower($_SERVER['REQUEST_METHOD'])){
            $ctrl = static::$config['router'][$rqst]['ctrl'];
        } else {
            $ctrl = static::$config['router']['default']['ctrl'];
        }

        //instantiate the controller
        $ctrl = 'Controller\\'.$ctrl;
        return new $ctrl(static::rqst());
    }

    /* Jump to...
     *
     *
     */
    static function go($url = '', $type = 'refresh', $cod = 302){
        //se tiver 'http' na uri então será externo.
        if (strpos($url, 'http://') === false
              || strpos($url, 'https://') === false)
                $url = URL . $url;

        //send header
        if (strtolower($type) == 'refresh') header('Refresh:0;url=' . $url);
        else header('Location: ' . $url, TRUE, $cod);

        //... and stop
        exit;
    }
}