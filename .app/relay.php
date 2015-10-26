<?php
//not in CLI mode, return nothing...
if(php_sapi_name() != 'cli') exit();

//includ tools
include 'config/init.php';
include 'lib/db.php';
include 'lib/aes.php';
include 'model/relay.php';

//configs ...
$host = '0.0.0.0'; //host
$port = '8080'; //port
$title = "Xhat - zumbi";
$null = NULL; //null var
$bufLen = 16784; //buffer (recever/send) length
$timerSet = ( 1 * 60 ); //em segundos = ( h * m * s )
$timer = time() + $timerSet; //start ...

//Status ...
$us_now = 0;
$us_max = 0;
$cha_now = 0;
$cha_max = 0;

//Command line settings...
array_shift($argv);
foreach($argv as $a){
    if(strpos($a, '-h') !== false || strpos($a, '?') !== false) exit(help());
    if(strpos($a, '-a:') !== false) $host = substr($a, 3);
    if(strpos($a, '-p:') !== false) $port = substr($a, 3);
    if(strpos($a, '-t:') !== false) $title = substr($a, 3);
    if(strpos($a, '-s') !== false) defined('SHOW') || define('SHOW', true);
    if(strpos($a, '-l') !== false) defined('LOG')  || define('LOG',  true);
}

//Default settings
defined('SHOW') || define('SHOW', false);
defined('LOG')  || define('LOG',  false);

//welcome message
terminal("PHP CHAT RELAY\n\tCTRL+C for stop");

//Initialize DB data Model
$db = new Model\Relay($config['db']['mysql']);
$db->initalize($title, $host, $port);

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

//if(isset($clients[0])) unset($clients[0]);

//echo "\n\n------------- clients: ".print_r($clients);

//start endless loop, so that our script doesn't stop ------------------------------------------------- START LOOP
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
            //echo "\n\n changed: ".print_r($changed_socket, true)."\n buffer: ".print_r($buf, true)."\n ---------finish Changed ---------\n\n";

            $skt = array_search($changed_socket, $changed);
            $received_text = unmask($buf); //unmask data
            $msg = json_decode($received_text); //json decode

            //Decodificando...
            $msg = $db->decMSG($msg);
            if($msg === false) break;

            //if (!isset($msg->channel) || $msg->channel == 'null')
                //break 1; //evitando null: null

            dp('linha 123, recebendo algum texto');

            //HTML scapes
            //$msg->message = strip_tags($msg->message, '<h1><h2><p><b><i><s><br><hr><ul><ol><li>');

            //if($msg->message == '//serveroutnow') exit("\r\n\r\n".'SERVER OUT From users online!!');

            terminal('MESSAGE IN', $msg); //echo
            //Call controllers
            switch ($msg->type) {

                case 'msg':
                case 'file':
                case 'audio':
                case 'video':
                case 'image':
                    //to private message/file
                    $tmpu = (isset($msg->to)) ? $msg->to : null;
                    //Atualiza o canal do usuário
                    $users[$skt]['channel'] = $msg->channel;
                    sendMessage(get_object_vars($msg), $tmpu, $msg->channel);

                    $db->saveMSG($msg);
                    break;


                case 'init':
                    //Checando se o canal existe
                    /*if($msg->channel != 0){ dp();
                        echo 'User: '.$msg->userid+' channel: '+$msg->channel;
                        $channel = $db->channelExists($msg->userid, $msg->channel);
                        if($channel === false) {
                            terminal('Canal invalido: '.$msg->channel);
                            sendMessage(array('type' => 'out',
                                                'id'=>$skt,
                                                'message'=>'This channel is OFF!'),
                                                null,
                                                $msg->channel);
                            break;
                        } else $msg->channelName = $channel['name'];
                    }*/
                    //insert new user
                    $msg->id = $skt;
                    updateUser($msg);
                    dp('Depois de INIT');

                    //return ID
                    sendMessage(array('type' => 'init',
                                      'id'=>$msg->id,
                                      'message'=>'',
                                      'users' => ''),
                                    $skt,
                                    $msg->channel);
                    dp('Depois de enviar mensagem');
                    /*
                    //search for users in just room.
                    $userList = searchUser('channel', $msg->channel);
                    //new user notice
                    sendMessage(array('type' => 'sinc',
                                      'id'=>$msg->id,
                                      'message'=>'new',
                                      'users' => $userList),
                                    null,
                                    $msg->channel);*/

                    break;

                /*case 'sinc':
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
                */
                default:
                    # no code...
                    break;
            }
            break 2; //exit this sub-loop, only
        }

        $buf = '';
        $buf = @socket_read($changed_socket, null, PHP_NORMAL_READ); dp('changed socket: '.$changed_socket);

        if ($buf === false) { // client is off?
            // remove client for $clients array
            $found_socket = array_search($changed_socket, $clients); echo "\n\nDESCON:".$found_socket."\n\n";

            //log
            terminal('DISCONNECTED', $users[$found_socket]);

            //Apagando o usuário nmo DB
            $db->deleteUser($users[$found_socket]['userid']);

            //notify all users about disconnected connection
            sendMessage(array('type' => 'out',
                              'id'=>$users[$found_socket]['userid'],
                              'message'=>''), null, $users[$found_socket]['channel']);

            //deleting this user
            unset($clients[$found_socket]);
            unset($users[$found_socket]);
        }
    }

    //TIMER ------------------------------------------------------------------------------------------------
    if($timer <= time()) {

        //Atualizando
        $us_now = count($users);
        $us_max = $us_now > $us_max ? $us_now : $us_max;

        //Verificando Status
        if($db->stop()) break;

        //Atualizando dados no BD
        $db->theUpdate($us_now, $us_max, $cha_now, $cha_max);

        $timer = time() + $timerSet;
    }
}

//close the listening socket (after BREAK LOOP)
socket_close($socket);

//Gravando o status de saida no DB
$db->theUpdate($us_now, $us_max, $cha_now, $cha_max, true);

//---------------------------------------------------------------------------------------------------- The FINISH!!




// FUNCTIONS \o_

function dp($txt = ''){
    global $clients, $users, $msg;
    echo "\n\n Dumping - $txt :\nMsg: ".print_r($msg, true)."\nUsers: \n".print_r($users, true)."\nClients: \n".print_R($clients, true)."\n -------- finish Dumping . \n";
}

//Send message for all || this user
function sendMessage($msg, $user = null, $channel = null) {
    terminal('MESSAGE OUT', $msg);
    //get global for users arrays
    global $clients, $users, $db;
    //Send for ALL
    if ($user == null) {
        foreach ($clients as $k => $v)  {
            if (isset($users[$k]['channel'])
                && $users[$k]['channel'] == $channel
                && isset($users[$k]['userid'])) {
                    $tmp = mask($db->encMSG(json_encode($msg), $users[$k]['userid']));
                    socket_write($v, $tmp, strlen($tmp));
            }
        }
    } elseif (is_resource($clients[$user])) {
        $tmp = mask($db->encMSG(json_encode($msg), $users[$user]['userid']));
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
        if (preg_match('/\A(\S+): (.*)\z/', $line, $matches)) $headers[$matches[1]] = $matches[2];
    }

    if(!isset($headers['Sec-WebSocket-Key'])) return false; //Não é um webSocket!?

    $secKey = $headers['Sec-WebSocket-Key'];
    $secAccept = base64_encode(pack('H*', sha1($secKey . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11')));
    //hand shaking header
    $upgrade =  "HTTP/1.1 101 Web Socket Protocol Handshake\r\n" .
                "Upgrade: websocket\r\n" .
                "Connection: Upgrade\r\n" .
                "WebSocket-Origin: $host\r\n" .
                "WebSocket-Location: ws://$host:$port\r\n" .
                "Sec-WebSocket-Accept:$secAccept\r\n\r\n";
    socket_write($client_conn, $upgrade, strlen($upgrade));

    return true;
}

//Insert/Update a user
function updateUser($data){
    global $users;
    $parms = array('userid', 'name', 'channel');
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