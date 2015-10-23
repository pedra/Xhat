<?php
/**
 * Description of Database
 *
 * @author http://plus.google.com/+BillRocha
 * @copyright   Bill Rocha - http://plus.google.com/+BillRocha
 * @license     MIT & GLP2
 * @version     0.0.1
 * @package     Lib
 * @access      public
 * @since       0.0.2
 *
 * Database Configuration
 * ex.:
 *
 *  echo 'Iniciou';
 *
 * $users = ['dsn'=>'sqlite:qzumba_users.db', 'user'=>null, 'passw'=>null];
 * $msg = ['dsn'=>'sqlite:qzumba_msg.db', 'user'=>null, 'passw'=>null];
 *
 * //conectando ----------------------------
 * $users = new Db($users);
 * $msg = new Db($msg);
 *
 * echo '<pre>';
 * $users->query('SELECT * FROM USERS');
 * print_r($users->result());
 *
 * $msg->query('SELECT * FROM MSG');
 * print_r($msg->result());
 *
 *
 * print_r($users->result()[0]->get('NAME'));
*/

namespace Lib;
use PDO;

class Db {

    private $dsn = 'sqlite:qzumba.db';
    private $user = null;
    private $passw = null;
    private $conn = null;

    private $sql    = null;
    private $result = null;
    private $rows = 0;
    private $error = [];



    function __construct($cfg = false){
        if(is_array($cfg)){
            $this->dsn = $cfg['dsn'];
            $this->user = $cfg['user'];
            $this->passw = $cfg['passw'];
        }
    }

    function connect(){
        if($this->conn == null)
            try{
            $this->conn = new PDO(  $this->dsn,
                                    $this->user,
                                    $this->passw);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e){
            trigger_error('Data base not connected!');
        }
        if(!is_object($this->conn)) trigger_error('I can not connect to the database',E_USER_ERROR);
        return $this->conn;
    }


    function query($sql,$parms = array()){
        $this->sql = $sql;
        $sth = $this->connect()->prepare($sql);
        $sth->execute($parms);
        $this->rows = $sth->rowCount();
        $this->error[$sql] = $sth->errorInfo();

        if($sth->columnCount() > 0) {
            return $this->result = $sth->fetchAll(PDO::FETCH_CLASS,"Lib\Row");
        } else {
            $this->result = false;
            return $this->rows;
        }
    }

    //Result Object
    function result(){
        if($this->result == null || count($this->result) == 0) return false;
        return $this->result;
    }
    //Limpa os resultados
    function clear(){
        $this->result = new Lib\Row;
    }

    //Pegando erros
    function getError(){
        return $this->error;
    }

    //return the number of rows affected by the last DELETE, INSERT or UPDATE
    function getRows(){
        return $this->rows;
    }

    //return last sql string
    function getSql(){
        return $this->sql;
    }

}

/**
 * Description of Row
 *
 * @author http://plus.google.com/+BillRocha
 */
class Row {

    private $__table = null;
    private $__where = null;
    private $id = null;


    function __construct(){
        //TODO: null
    }


    //Salva os dados no banco de dados [insert/update]
    function save(){
        //if($this->id == null) //INSERT INTO
        //else //UPDATE

        /* ex.: INSERT INTO ($this->__table) SET ($this->$key) = ($this->$value)
         *      UPDATE FROM ($this->__table) VALUES(($this->$key) = ($this->$value)) WHARE ($this->__where)
         *
         *      in foreach: bypass $__table and $__whare !!
         */
    }


    /** GET
     * Get parameter value
     * @param string $parm
     * @return boolean
     */
    function get($parm = false){
        if(isset($this->$parm)) return $this->$parm;
        return false;
    }

    //Return $this as array
    function getArray(){
        foreach ($this as $k=>$v) {
            $a[$k] = $v;
        }
        return $a;
    }

    /** SET
     * Set parameter
     * @param string|array $parm Name of parameter or array of parameter name and value
     * @param mixed $value Value of parameter
     * @return boolean
     */
    function set($parm, $value = null){
        if(is_array($parm)){
            foreach($parm as $k=>$v){ $this->$k = $v; }
            return $this;
        }
        elseif(isset($this->$parm)) {
            $this->$parm = $value;
            return $this;
        }
        else return false;
    }

}