<?php
//not in CLI mode, return nothing...
if(php_sapi_name() != 'cli') exit();

include 'lib/db.php';

$db = new Lib\Db(['dsn'=>'mysql:host=localhost;dbname=zumbi;charset=utf8', 'user'=>'zumbi', 'passw'=>'zumbi#123456']);

error_reporting(E_ALL ^ E_STRICT);
date_default_timezone_set('America/Sao_Paulo');

//configs...
$host = '0.0.0.0'; //host
$port = '8080'; //port
$owner = 1; // 1 = Qzumba test
$null = NULL; //null var
$bufLen = 16784; //buffer (recever/send) length
$timerSet = ( 1 * 3 * 60 ); //em segundos = ( h * m * s )
$MarketMessage = null;//@json_decode(@file_get_contents('../market/marketing.json'));
$MarketCount = 0;
$timer = time() + $timerSet;

$SqlId = null;
$us_now = 1;
$us_max = 1;
$cha_now = 1;
$cha_max = 1;

//Command line settings...
array_shift($argv);
foreach($argv as $a){
    if(strpos($a, '-h') !== false || strpos($a, '?') !== false) exit(help());
    if(strpos($a, '-a:') !== false) $host = substr($a, 3);
    if(strpos($a, '-p:') !== false) $port = substr($a, 3);
    if(strpos($a, '-o:') !== false) $owner = substr($a, 3);
    if(strpos($a, '-s') !== false) defined('SHOW') || define('SHOW', true);
    if(strpos($a, '-l') !== false) defined('LOG')  || define('LOG',  true);
}

//Default settings
defined('SHOW') || define('SHOW', false);
defined('LOG')  || define('LOG',  false);

//welcome message
terminal("PHP CHAT RELAY\n\tCTRL+C for stop");

//DB insert
$db->query('INSERT INTO relay (PID,STATUS,SCRIPT,OWNER,IP,PORT,CHA_NOW,CHA_MAX,US_NOW,US_MAX,ERRORS,START,LAST_UPDATE)
                          VALUES (:pid,1,:script,:owner,:ip,:port,0,0,0,0,0,:st,:end)',
                          [':pid'=>getmypid(),
                           ':script'=>__FILE__,
                           ':owner'=>$owner,
                           ':ip'=>$host,
                           ':port'=>$port,
                           ':st'=>date('Y-m-d H:i:s'),
                           ':end'=>date('Y-m-d H:i:s')]);
//pegando ID
$db->query('SELECT MAX(ID)ID FROM relay WHERE PID = '.getmypid());
$SqlId = isset($db->result()[0]->ID) ? $db->result()[0]->ID : null;

$db->query('SELECT * FROM market_msg WHERE market_msg.OWNER = :ow', [':ow'=>$owner]);
if(!$db->result()) terminal("Marketing can't loaded!");
else {
    $MarketMessage = $db->result();
    terminal("Marketing loaded.");
}

//Create TCP/IP stream socket
$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
//reuseable port
socket_set_option($socket, SOL_SOCKET, SO_REUSEADDR, 1);

//bind socket to specified host
socket_bind($socket, 0, $port);

//listen to port
if (socket_listen($socket))
    terminal("Wait for connections!\n\tAddress: ".$host.':'.$port);

//create & add listning socket to the list
$clients = array($socket);
$users = array();

//start endless loop, so that our script doesn't stop
while (true) {

    //manage multipal connections
    $changed = $clients;
    //returns the socket resources in $changed array
    socket_select($changed, $null, $null, 0, 10);


    //check for new socket
    if (in_array($socket, $changed)) {
        $socket_new = socket_accept($socket); //accepet new socket
        $clients[] = $socket_new; //add socket to client array

        $header = socket_read($socket_new, $bufLen); //read data sent by the socket

        //terminal("HEADER \r\n", $header);
        $hc = perform_handshaking($header, $socket_new, $host, $port); //perform websocket handshake
        if(!$hc) array_pop($clients); //ignora se não for handshaking !!

        //socket_getpeername($socket_new, $ip); //get ip address of connected socket //IRRELEVANTE

        //make room for new socket
        $found_socket = array_search($socket, $changed);
        unset($changed[$found_socket]);

        $skt = array_search($socket_new, $clients);
        $users[$skt] = array('channel' => 'null');

        terminal('CONNECTED', $users);
    }


    //loop through all connected sockets
    foreach ($changed as $changed_socket) {

        //check for any incomming data
        while (socket_recv($changed_socket, $buf, $bufLen, 0) >= 1) {

            $skt = array_search($changed_socket, $changed);
            $received_text = unmask($buf); //unmask data
            $msg = json_decode($received_text); //json decode

            if (!isset($msg->channel) || $msg->channel == 'null')
                break 2; //evitando null: null

            //Checando se o canal existe
            $db->query('SELECT * FROM channel WHERE channel.TOKEN = :tk', [':tk'=>$msg->channel]);
            if(!$db->result()) {
                terminal('Channel inválido: '.$msg->channel);
                sendMessage(array('type' => 'out',
                                    'id'=>$skt,
                                    'message'=>'This channel is OFF!'),
                                    null,
                                    $msg->channel);
                break;
            } else $msg->channelName = $db->result()[0]->NAME;

            //HTML scapes
            //$msg->message = strip_tags($msg->message, '<h1><h2><p><b><i><s><br><hr><ul><ol><li>');

            //if($msg->message == '//serveroutnow') exit("\r\n\r\n".'SERVER OUT From users online!!');

            terminal('MESSAGE IN', $msg); //terminal display
            //Call controllers
            switch ($msg->type) {

                case 'openmsg':
                    $tmsg = json_decode($msg->message);
                    $msg->message = $tmsg;
                    sendMessage(get_object_vars($msg), null, $msg->channel);
                    break;

                case 'msg':
                case 'file':
                case 'audio':
                case 'video':
                case 'image':
                    //to private message/file
                    $tmpu = (isset($msg->to)) ? $msg->to : null;
                    sendMessage(get_object_vars($msg), $tmpu, $msg->channel);

                    $db->query('INSERT INTO msg (TYPE, USER, MSG, CHANNEL, IDATE)
                                    VALUES (:type, :user, :msg, :cha, :idt)',
                                    [':type'=>$msg->type,':user'=>$msg->id,':msg'=>$msg->message, ':cha'=>$msg->channel, ':idt'=>date('Y-m-d H:i:s')]);
                    break;

                case 'getMsg':
                    //return all messages in the last 24 hours

                    $db->query("SELECT *
                                    FROM msg
                                    WHERE CHANNEL = :chn
                                    AND msg.DATA >= :dti",[':chn'=>$msg->channel,':dti'=>date('Y-m-d H:i:s', time()-(24*60*60))]);

                    $js = json_encode($db->result());
                    //print_r($db);

                    sendMessage(array('type' => 'getMsg',
                                      'id'=>$msg->id,
                                      'message'=>$js),
                                    $skt,
                                    $msg->channel);
                    break;

                case 'init':
                    //insert new user
                    $msg->id = $skt;

                    updateUser($msg);

                    //Pegando ultimas mensagens do canal
                    $db->query("SELECT *
                                    FROM msg
                                    WHERE CHANNEL = :chn
                                    AND msg.DATA >= :dti",[':chn'=>$msg->channel,':dti'=>date('Y-m-d H:i:s', time()-86400)]);
                    $js = json_encode($db->result());

                    //return ID
                    sendMessage(array('type' => 'init',
                                      'id'=>$msg->id,
                                      'message'=>$js,
                                      'users' => ''),
                                    $skt,
                                    $msg->channel);

                    //search for users in just room.
                    $userList = searchUser('channel', $msg->channel);
                    //new user notice
                    sendMessage(array('type' => 'sinc',
                                      'id'=>$msg->id,
                                      'message'=>'new',
                                      'users' => $userList),
                                    null,
                                    $msg->channel);
                    break;

                case 'sinc':
                    //search for users in just room.
                    $userList = searchUser('channel', $msg->channel);
                    //new user notice
                    sendMessage(array('type' => 'sinc',
                                      'id'=>$skt,
                                      'message'=>'update',
                                      'users' => $userList),
                                    null,
                                    $msg->channel);
                    break;

                case 'out':
                    //delete user
                    unset($clients[$skt], $users[$skt]);

                    //search for users in just room.
                    $userList = searchUser('channel', $msg->channel);

                    //send user list
                    sendMessage(array('type' => 'sinc',
                                      'id'=>$skt,
                                      'message'=>'out',
                                      'users' => ''),
                                    null,
                                    $msg->channel);
                    break;

                default:
                    # no code...
                    break;
            }
            break 2; //exit this loop
        }

        $buf = @socket_read($changed_socket, null, PHP_NORMAL_READ);
        if ($buf === false) { // check disconnected client
            // remove client for $clients array
            $found_socket = array_search($changed_socket, $clients);

            //socket_getpeername($changed_socket, $ip); //IRRELEVANTE

            //get user channel
            $channel = $users[$found_socket]['channel'];

            //log
            terminal('DISCONNECTED', $users[$found_socket]);

            //deleting this user
            unset($clients[$found_socket]);
            unset($users[$found_socket]);

            //search for users in just room.
            //$userList = searchUser('channel', $channel);

            //notify all users about disconnected connection
            sendMessage(array('type' => 'sinc', 'id'=>$found_socket, 'message'=>'out', 'users' =>''), null, $channel);
        }
    }

    //Market message ------------------------------------------------------------------------------------------------
    if($MarketMessage != null && $timer <= time()) {
        $mktO = new StdClass();
        $mktO->message = $MarketMessage[$MarketCount]->MSG;
        $mktO->name = $MarketMessage[$MarketCount]->TITLE;

        $MarketMsg = ['type'=>'market','message'=>$mktO];
        $MarketCount ++;
        if($MarketCount >= count($MarketMessage)) $MarketCount = 0;

        foreach($clients as $k=>$cli){
            if (isset($users[$k]['channel'])) {
                terminal('MARKET OUT: ', $MarketMsg);
                $mkt = mask(json_encode($MarketMsg));
                socket_write($cli, $mkt, strlen($mkt));
                terminal('MARKET OUT: '.print_r($cli, true), $mkt);
            }
        }

        //Atualizando
        $us_now = count($users);
        $us_max = $us_now > $us_max ? $us_now : $us_max;

        //Verificando Status
        $db->query('SELECT STATUS FROM relay WHERE ID = '.$SqlId);
        $tmp = $db->result();
        if(isset($tmp[0]) && $tmp[0]->STATUS == 2) break; //parando se for solicitado (STATUS = 2)

        //Atualizando dados no BD
        $db->query('UPDATE relay SET LAST_UPDATE = :end, US_NOW = :un, US_MAX = :um, CHA_NOW = :cn, CHA_MAX = :cm WHERE ID = :id',
            [':end'=>date('Y-m-d H:i:s'),
             ':un'=>$us_now,
             ':um'=>$us_max,
             ':cn'=>$cha_now,
             ':cm'=>$cha_max,
             ':id'=>$SqlId]);

        $timer = time() + $timerSet;
    }
}
//close the listening socket
socket_close($socket);

//Gravando o status de saida no DB
$db->query('UPDATE relay
            SET STATUS = 0,
                LAST_UPDATE = :lud,
                US_NOW = :un,
                US_MAX = :um,
                CHA_NOW = :cn,
                CHA_MAX = :cm
            WHERE ID = :id',
            [':lud'=>date('Y-m-d H:i:s'),
             ':un'=>$us_now,
             ':um'=>$us_max,
             ':cn'=>$cha_now,
             ':cm'=>$cha_max,
             ':id'=>$SqlId]
        );



//                      FINISH!!




// -------------------------- functions: --------------------------

//Send message for all || this user
function sendMessage($msg, $user = null, $channel = null) {
    terminal('MESSAGE OUT', $msg);
    //get global for users arrays
    global $clients, $users;
    //Send for ALL
    if ($user == null) {
        foreach ($clients as $k => $v) {
            if (isset($users[$k]['channel']) && $users[$k]['channel'] == $channel) {
                //$msg['id'] = $k;
                $tmp = mask(json_encode($msg));
                socket_write($v, $tmp, strlen($tmp));
            }
        }
    } elseif (is_resource($clients[$user])) {
        $tmp = mask(json_encode($msg)); //formating
        socket_write($clients[$user], $tmp, strlen($tmp));
    }
}

//Unmask incoming framed message
function unmask($text) {
    $length = ord($text[1]) & 127;
    if ($length == 126) {
        $masks = substr($text, 4, 4);
        $data = substr($text, 8);
    } elseif ($length == 127) {
        $masks = substr($text, 10, 4);
        $data = substr($text, 14);
    } else {
        $masks = substr($text, 2, 4);
        $data = substr($text, 6);
    }
    $text = "";
    for ($i = 0; $i < strlen($data); ++$i) {
        $text .= $data[$i] ^ $masks[$i % 4];
    }
    return $text;
}

//Encode message for transfer to client.
function mask($text) {
    $b1 = 0x80 | (0x1 & 0x0f);
    $length = strlen($text);

    if ($length <= 125)
        $header = pack('CC', $b1, $length);
    elseif ($length > 125 && $length < 65536)
        $header = pack('CCn', $b1, 126, $length);
    elseif ($length >= 65536)
        $header = pack('CCNN', $b1, 127, $length);
    return $header . $text;
}

//handshake new client.
function perform_handshaking($receved_header, $client_conn, $host, $port) {
    $headers = array();
    $lines = preg_split("/\r\n/", $receved_header);
    foreach ($lines as $line) {
        $line = rtrim($line);
        if (preg_match('/\A(\S+): (.*)\z/', $line, $matches)) {
            $headers[$matches[1]] = $matches[2];
        }
    }

    if(!isset($headers['Sec-WebSocket-Key'])) return false; //Não é um webSocket

    $secKey = $headers['Sec-WebSocket-Key'];
    $secAccept = base64_encode(pack('H*', sha1($secKey . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11')));
    //hand shaking header
    $upgrade = "HTTP/1.1 101 Web Socket Protocol Handshake\r\n" .
            "Upgrade: websocket\r\n" .
            "Connection: Upgrade\r\n" .
            "WebSocket-Origin: $host\r\n" .
            "WebSocket-Location: ws://$host:$port\r\n" .
            "Sec-WebSocket-Accept:$secAccept\r\n\r\n";
    socket_write($client_conn, $upgrade, strlen($upgrade));

    return true;
    //terminal($upgrade, true);
}

//Insert/Update a user
function updateUser($data){
    global $users;
    $parms = array('id', 'name', 'channel');
    foreach($data as $k=>$v){
        if(in_array($k, $parms)) $users[$data->id][$k] = $v;
    }
}

/* Search in users list for an value in key
 *
 * @param {string} key = name of the index
 * @param {string} value = value searched
 * @returns {array|boolean} User list data or false
 */
function searchUser($key, $value){
    global $users;
    $list = [];
    foreach($users as $k=>$v){
        if(isset($v[$key]) && $v[$key] == $value){
            $list[$k] = $v;
            unset($list[$k]['channel']);
        }
    }
    return ($list == []) ? false : $list;
}

//tabula data to echoes...
function tabell($val, $tab = 0){
    $o = '';
    $t = '';
    for($i = $tab; $i > 0; $i --){$t .= "\t";}//adicionando tabulação
    foreach($val as $k=>$v){
        if(is_bool($v)) $v = ($v) ? 'true':'false';
        $o .= "\r\n".$t.$k.': '.(is_object($v) || is_array($v) ? tabell($v, ($tab + 1)) : $v);
    }
    return $o;
}

//Echo log data and save in file to web monitoring...
function terminal($text, $msg = null){
    if(LOG){
        if(!is_dir(__DIR__.'/log')) mkdir(__DIR__.'/log', 0777);
        file_put_contents(__DIR__.'/log/'.date('YmdHi').'.log',
            json_encode(['date'    => date('ymdHis'),
                         'memory'  => memory_get_usage(),
                         'mpeak'   => memory_get_peak_usage(),
                         'text'    => $text,
                         'data'    => $msg])."\r\n", FILE_APPEND);
    }
    if(SHOW){
        echo '['.date('Ymd His').']'.($text ? "\r\n\t" . $text : '')
            .(is_object($msg) || is_array($msg) ? tabell($msg, 2)."\r\n" :$msg)
            ."\r\n\r\n";
    }
}

//Help display
function help(){
    return '
  PHP Chat Relay -- Socket Server

  Usage: php server.php [options]

  -a<:address>  Set host address [ex.: -a:192.168.10.1 - default "0.0.0.0"]
  -p<:port>     Set port number  [ex.: -p:81 - default "8080"]
  -s            Show information about actions/messages
  -l            Save all informations in log file
  -h            This help


  CTRL+C        Stop this server.
  ';
}