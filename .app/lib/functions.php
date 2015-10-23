<?php
//Check if file exists - return real path of file or false
function _file_exists($file){
    if(file_exists($file)) return $file;
    if(file_exists(ROOT.$file)) return ROOT.$file;
    if(file_exists(RPHAR.$file)) return RPHAR.$file;
    $xfile = str_replace(ROOT, RPHAR, $file);
    if(file_exists($xfile)) return $xfile;
    return false;
}

//Print mixed data and exit
function e($v) { exit(p($v)); }
function p($v, $echo = false) {
    $tmp = '<pre>' . print_r($v, true) . '</pre>';
    if ($echo) echo $tmp;
    else return $tmp;
}

//Nome do MÊS em português
function _mes($n = 1){
    $m=['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
    if($n < 1 || $n > 12) $n = 1;
    return $m[$n-1];
}

//DIA da semana
function _dia($n){
    $d = ['Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado'];
    if($n < 0 || $n > 6) $n = 0;
    return $d[$n];
}


//Download de arquivo em modo PHAR (interno)
function download($reqst = '') {

    //checando a existencia do arquivo solicitado
    $reqst = _file_exists($reqst);
    if($reqst == false) return false;

    //gerando header apropriado
    include ROOT . '.php/config/mimetypes.php';
    $ext = end((explode('.', $reqst)));
    if (!isset($_mimes[$ext])) $mime = 'text/plain';
    else $mime = (is_array($_mimes[$ext])) ? $_mimes[$ext][0] : $_mimes[$ext];

    //get file
    $dt = file_get_contents($reqst);

    //download
    ob_end_clean();
    ob_start('ob_gzhandler');

    header('Vary: Accept-Language, Accept-Encoding');
    header('Content-Type: ' . $mime);
    header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 31536000) . ' GMT');
    header('Last-Modified: ' . gmdate('D, d M Y H:i:s', filemtime($reqst)) . ' GMT');
    header('Cache-Control: must_revalidate, public, max-age=31536000');
    header('Content-Length: ' . strlen($dt));
    header('x-Server: Qzumba.com');
    header('ETAG: '.md5($reqst));
    exit($dt);
}

// error handler function
function errorHandler($errno, $errstr, $errfile, $errline) {
    switch ($errno) {
    case E_USER_ERROR:
        echo "<b>ERROR:</b> [$errno] $errstr<br>
        <b>File: </b>$errfile [$errline]<br>
        Aborting...<br>";
        exit(1);
        break;

    case E_USER_WARNING:
        echo "<b>WARNING:</b> [$errno] $errstr<br><b>File:</b> $errfile [$errline]";
        break;

    case E_USER_NOTICE:
        echo "<b>NOTICE:</b> [$errno] $errstr<br><b>File:</b> $errfile [$errline]";
        break;

    default:
        echo "<b>Unknown error type:</b> [$errno] $errstr<br><b>File:</b> $errfile [$errline]";
        break;
    }

    /* Don't execute PHP internal error handler */
    return true;
}

function exceptionHandler($e) {
    if(get_class($e) == 'PDOException'){
        $err = $e->getMessage().'<br>code: '.$e->getCode();
    } else {
        $err =  '<b>Fatal error</b>:  Uncaught exception \''.get_class($e).'\' <br>'.
        '<b>Code:</b>'.$e->getCode().'<br>'.
        '<b>Message:</b> <i>'.$e->getMessage().'</i><br>'.
        '<b>Stack trace:</b><pre>'.$e->getTraceAsString().'</pre>'.
        '<b>Thrown in: </b>'.$e->getFile().' ['.$e->getLine().']';
    }

    $d = new Lib\Doc('error');
    $d->val('title', 'Zumbi :: Error')
      ->val('htitle', 'Error')
      ->val('error', $err)
      ->insertStyles(['reset','admin'])
      ->body('error')
      ->render()
      ->send();
 }