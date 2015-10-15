

function startWs(){
    FILE.set.password(USERKEY);

    if (WS === null) {

        //WebSocket ----------------------------------------------------------------
        WS = new WebSocket(wsUri);

        WS.onopen = function() {
            var user = AES.enc(USERNAME, USERKEY);
            WS.send(JSON.stringify({type:'init',message:'',name: USERNAME,channel: USERCHANNEL}));
            SOUND.play('final');
        };

        WS.onmessage = function(e) {
            var data = JSON.parse(e.data);
            Message.show(data);
        };

        WS.onerror = function(e) {
            var d = 'undefined' === typeof e.data ? 'undefined!' : e.data;
            _msg('--- Error: ' + d + ' ---');
            if(WS === null || WS.readyState !== WS.OPEN) exit();
        };

        WS.onclose = function() {
            exit();
        };
    } else {
        var user = AES.enc(USERNAME, USERKEY);
        WS.send(JSON.stringify({type:'sinc', message:'', name: USERNAME, channel: USERCHANNEL}));
    }
};

function sendMsg(e, type){

    if(WS === null || WS.readyState !== WS.OPEN) exit();

    if("undefined" === typeof type) type = 'msg';

    if (e.substr(0, 7) === '//loren') {
        _('message').value = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        return false;
    }
    //get Gformat
    var txt = _formatTxt(e);

    if(txt.length > 3000) {
        return _msg('Mensagem muito LONGA! Não posso enviar.');
    }

    AES.size(256);
    txt = AES.enc(JSON.stringify({message: txt, name: USERNAME}), USERKEY);

    //Send message
    WS.send(JSON.stringify({type: type, message: txt, channel: USERCHANNEL, id: USERID}));

    //Clear target
    _('message').value = '';
    _('message').className = ' ';
}



function exit(){
    WS.send(JSON.stringify({type: 'out', message: '', channel: USERCHANNEL}));
    SOUND.play('final');
    WS.close();
    setTimeout(function() {
        document.location.href = document.location.href;
    }, 400);
}