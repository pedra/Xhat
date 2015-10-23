

function startWs(){
    FILE.set.password(USER.key);
    AES.size(256);

    if (WS === null) {

        //WebSocket ----------------------------------------------------------------
        WS = new WebSocket(wsUri);

        WS.onopen = function() {
            WS.send(JSON.stringify({msg:AES.enc(JSON.stringify({type:'init',message:'', channel:1}), USER.key), id:USER.id}));
            //SOUND.play('final');
        };

        WS.onmessage = function(e) {
            var data = JSON.parse(AES.dec(e.data, USER.key));
            MSG.show(data);
        };

        WS.onerror = function(e) {
            var d = 'undefined' === typeof e.data ? 'undefined!' : e.data;
            _msg('--- Error: ' + d + ' ---');
            if(WS === null || WS.readyState !== WS.OPEN) {
                console.log('ERROR');
                exit();
            }
        };

        WS.onclose = function() {
            console.log('CLOSE');
            exit();
        };

    } else {
        WS.send(JSON.stringify({msg:AES.enc(JSON.stringify({type:'sync',message:'', channel:0}), USER.key), id:USER.id}));
    }
};

function sendMsg(e, type){ console.log(e); console.log(USER.channel)

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

    //Send message
    AES.size(256); console.log(JSON.stringify({msg:AES.enc(JSON.stringify({type:type,message:txt, channel:USER.channel}), USER.key), id:USER.id}));
    WS.send(JSON.stringify({msg:AES.enc(JSON.stringify({type:type,message:txt, channel:USER.channel}), USER.key), id:USER.id}));

    //Clear target
    _('message').value = '';
    _('message').className = ' ';
}



function exit(){
    AES.size(256);
    WS.send(JSON.stringify({msg:AES.enc(JSON.stringify({type:'out',message:'', channel:USER.channel}), USER.key), id:USER.id}));
    SOUND.play('final');
    WS.close();
    setTimeout(function() {
        //document.location.href = document.location.href;
        console.log('REINICIE')
    }, 400);
}