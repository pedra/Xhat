var AJAX,
    WS = null,
    USERKEY,
    USERID,
    USERNAME,
    USERCHANNEL,
    PANEL = 'group',
    PAGE = 2,
    tmp;

window.onload = function(){

    //Iniciando LIBRARYS
    SOUND = new lib.sound();
    FILE = new lib.upload();
    FILE.set.statusElement(_('fileList'));

    _('irsa').value = rpass(40);

    _('go').onclick = function(){
        USERKEY = _('irsa').value;
        var login = _('login').value;
        var password = _('password').value;

        if(USERKEY.length < 20) return _msg('Digite pelo menos 20 caracteres!');

        var js = JSON.stringify({login:login, password:password, asskey:USERKEY})

        //convertendo...
        vk = RSA.encrypt(js, RSA.getPublicKey(key));
        _msg('Enviando dados criptgrafados ao servidor.<br>Aguarde...');

        AJAX = new lib.ajax();
        AJAX.set.url(URL+'login/checkUser');
        AJAX.set.data({key:vk});
        AJAX.set.complete(function(data){
            var e = JSON.parse(AES.dec(data, USERKEY));

            if(e) {
                USERID = e.ID;
                USERNAME = e.NAME;

                _('groups').innerHTML += mountList(e.li);

                //Start Web Socket
                startWs();

                //Destroy login
                _('formLogin').remove();
                _('zumbi').style.display = 'block';

            } else {
                _msg('Infelizmente a chave não confere!<br>Tente de novo ou entre em contato com o suporte técnico.');
            }
        })
        AJAX.send();
    }

    _('goback').onclick = function(){ goback();}
    _('gonext').onclick = function(){ gonext();}

    _('file').onclick = function(){
        _('page3').scrollTop = _('page3').scrollHeight;
        console.log(_('page3').scrollTop + ' - '+ _('page3').scrollHeight)
    }

    //MESSAGE LISTERN ----------------------------------------------------------
    _('message').onkeydown = function(e) {
        if (e.which === 9) {
            e.preventDefault();
            e.target.value += '    ';
        }
    };

    _('message').onkeyup = function(e) {
        if(e.which == 13 && e.target.value.trim().length > 0) {
            if (e.target.value.trim() === '' || e.shiftKey) return false;
            else sendMsg(e.target.value);
        }
    };

    _('send').onclick = function(){
        if (_('message').value.trim() === '') return false;
        else sendMsg(_('message').value);
    }

}


function mountList(o){
    var a = '<ul>';
    for(var i in o){
        var m = o[i]['msg'];
        var m = m > 0 ? '[ ' +(m > 1 ? m+' mensagens' : m+' mensagem')+' ]' : '';
        a += '<li id="lst'+i+'" onclick="getMsgGroup('+i+')">'+o[i]['name']+'<span>'+o[i]['title']+'<span>'+m+'</span></span></li>';
        if("undefined" != typeof o[i]['content']) a += mountList(o[i]['content']);
    }
    return a + '</ul>';
}

function mountMsg(o){
    var a = '<ul>';
    for(var i in o){
        if("undefine" !== typeof o[i]['content']){
            a += '<div id="msg["'+i+']" class="msg"><h5>'+o[i]['name']+'</h5><div class="msgcontent">'+o[i]['content']+'</div></div>';
        }
    }
    return a + '<ul>';
}

function getMsgGroup(g){
    AJAX.set.url(URL+'msg/getMsgGroup/');
    AJAX.set.data({enc:AES.enc(JSON.stringify({group:g}), USERKEY), id:USERID});
    AJAX.set.complete(function(data){
        var e = JSON.parse(AES.dec(data, USERKEY));

        if(e) _('chat').innerHTML = mountMsg(e);
        else  _msg('Nenhuma mensagem não lida.');

        _('page3').scrollTop = _('page3').scrollHeight;

        USERCHANNEL = g;
        PAGE = 2;
        gonext()
    })
    AJAX.send();
}

function getUserGroupStatus(){
    AJAX = new lib.ajax();
    AJAX.set.url(URL+'msg/getUserGroupStatus');
    AJAX.set.data({enc:AES.enc(JSON.stringify({group:'nada'}), USERKEY), id:USERID});

    AJAX.set.complete(function(data){
        var e = JSON.parse(AES.dec(data, USERKEY));

        if(e) {
            _('groups').innerHTML = mountList(e.li);
            _('username').innerHTML = USERNAME;

        } else {
            _msg('Infelizmente a chave não confere!<br>Tente de novo ou entre em contato com o suporte técnico.');
        }
    })
    AJAX.send();
}


function goback(){
    if(PAGE == 2) {
        _('page1').className = 'page';
        _('page2').className = 'page tonext';

        _('goback').innerHTML = 'sair';
        _('gonext').innerHTML = 'grupos';

        PAGE = 1;
        _('text').innerHTML = 'Usuários';
        return;
    }

    if(PAGE == 3) {
        _('page2').className = 'page';
        _('page3').className = 'page tonext';

        _('goback').innerHTML = 'usuários';
        _('gonext').innerHTML = 'mensagens';

        PAGE = 2;
        _('text').innerHTML = 'Grupos';
        return;
    }

    if(PAGE == 4) {
        _('page3').className = 'page';
        _('page4').className = 'page tonext';

        _('goback').innerHTML = 'grupos';
        _('gonext').innerHTML = 'arquivos';

        PAGE = 3;
        _('text').innerHTML = 'Mensagens';
        return;
    }

    if(PAGE == 1) document.location = document.location;
}

function gonext(){

    if(PAGE == 1) {
        _('page2').className = 'page';
        _('page1').className = 'page toback';

        _('goback').innerHTML = 'usuários';
        _('gonext').innerHTML = 'mensagens';

        PAGE = 2;
        _('text').innerHTML = 'Grupos';
        return;
    }

    if(PAGE == 2) {
        _('page3').className = 'page';
        _('page2').className = 'page toback';

        _('goback').innerHTML = 'grupos';
        _('gonext').innerHTML = 'arquivos';

        PAGE = 3;
        _('text').innerHTML = 'Mensagens';
        return;
    }

    if(PAGE == 3) {
        _('page4').className = 'page';
        _('page3').className = 'page toback';

        _('goback').innerHTML = 'mensagens';
        _('gonext').innerHTML = 'sair';

        PAGE = 4;
        _('text').innerHTML = 'Arquivos';
        return;
    }

    if(PAGE == 4) document.location = document.location;
}

function rpass(chars) {
    if("undefined" == typeof chars || chars > 40 || chars < 0) chars = 20;
    var pass = '', ascii = [[48, 57],[64,90],[97,122]];
    for (var i= 0; i < chars; i++){
        var b = Math.floor(Math.random()*ascii.length);
        pass += String.fromCharCode(Math.floor(Math.random()*(ascii[b][1]-ascii[b][0]))+ascii[b][0]);
    }
    return pass;
}

