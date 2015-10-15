<?php

namespace Controller;
use Model;
use Lib;
use Lib\Qzumba as Q;
use Lib\Doc;


abstract class Qcontroller {

    public $model = null;
    public $key = null;

    /** Abstratic Controller constructor
     *  -- Bypass it in your controller
     */
	function __construct($rqst){
        //EStancia Model\Zumbi para n o Objeto
        $this->model = new Model\Zumbi;

		if(isset($rqst[1]) && method_exists($this, $rqst[1])){
			return $this->{$rqst[1]}($rqst);
		} else {
			return $this->main($rqst);
		}
	}

    /** Default MAIN method
     * -- Bypass it in your controller
     */
	function main(){
		$d = new Doc('nopage');
		$d->sendCache();
		$d->val('title', 'Zumbi :: 404')
		  ->insertStyles(['reset','nopage'])
		  ->body('nopage')
		  ->render()
		  ->send();
	}


	// ----------- USER FUNCTIONS --------------

    /** Decodifica entrada via Post
     *
     *
     */
    function _decodePostData(){
        if(!isset($_POST['data'])) return false;
        $rec = json_decode($_POST['data']);

        //Se não for JSON...
        if(!is_object($rec)) return false;

        if(isset($rec->enc)){
            //$zumbi = new Model\Zumbi;
            $this->key = $this->model->getUserKey($rec->id);
            if($this->key === false) return false;

            //Decriptando
            Lib\Aes::size(256);
            return ['data'=>$rec,'dec'=>json_decode(Lib\Aes::dec($rec->enc, $this->key))];
        }
        return ['data'=>$rec];
    }

    /** Envia dados criptografados para o browser
     *
     *
     */
    function _sendEncriptedData($dt){
        //Json encoder
        $enc = json_encode($dt);

        //Encriptando
        Lib\Aes::size(256);
        $enc = Lib\Aes::enc($enc, $this->key);

        //Enviando
        exit($enc);
    }


}