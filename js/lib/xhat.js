

function startWs(){
    FILE.set.password(USER.key);
    AES.size(256);

    if (WS === null) {

        //WebSocket ----------------------------------------------------------------
        _msg('Conectando em "'+wsUri+'" ....');
        WS = new WebSocket(wsUri);

        WS.onopen = function() {
            _msg('Conectado ao <b>relay</b> com sucesso!');
            WS.send(JSON.stringify(
                {
                    msg:AES.enc(JSON.stringify(
                        {
                            type:'init',
                            message:'',
                            channel:1
                        }),
                        USER.key),
                    id:USER.id
                }
            ));
        };

        WS.onmessage = function(e) {
            var data = JSON.parse(AES.dec(e.data, USER.key));

            if("undefined" !== typeof data.type && data.type == 'msg'){
                SOUND.play('msgin');
                painel('chat');
                MSG.show(data);
            }
        };

        WS.onerror = function(e) {
            _msg('<b>Erro na conexão!<b><br>'+typeof e.data ? 'undefined!':e.data+' ...');
        };

        WS.onclose = function() {
            _msg('Conexão <b>perdida</b>!<br>É necessário reiniciar.');
            exit();
        };

    } else {
        WS.send(JSON.stringify(
            {
                msg:AES.enc(JSON.stringify(
                    {
                        type:'sync',
                        message:'',
                        channel:0
                    }), USER.key),
                id:USER.id
            }));
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

    //Send message
    AES.size(256);
    WS.send(JSON.stringify(
        {
            msg:AES.enc(JSON.stringify(
                {
                    type:type,
                    message:txt,
                    channel:USER.channel
                }), USER.key),
            id:USER.id
        }));

    //Clear target
    _('message').value = '';
    _('message').style.display = 'none';

    //show chat
    painel('chat');
}

//Função de saída do sistema (logout)
function exit(){
    SOUND.play('final');

    AES.size(256);
    WS.send(JSON.stringify({
        msg:AES.enc(
            JSON.stringify(
                {
                    type:'out',
                    message:'',
                    channel:USER.channel
                })
            , USER.key)
        , id:USER.id})
    );

    WS.close();

    setTimeout(function() {
        document.location.href = document.location.href;
    }, 2000);
}