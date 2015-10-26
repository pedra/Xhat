var AJAX,
    WS = null,
    MSG,
    USER = {
        id: null,
        name: null,
        channel: null,
        key: null
    },
    PAGE = 2,
    CHAT,
    tmp;

window.onload = function(){

    //Iniciando LIBRARYS
    SOUND = new lib.sound();
    FILE = new lib.upload();
    FILE.set.statusElement(_('fileList'));

    CHAT = _('chat');

    //TESTE ONLY --- BEGIN
    _('help').onclick = function (e){
        if(e.target.nodeName == 'LI'){
            _('login').value = e.target.innerHTML;
            _('password').value = '1234567890';
        }
    }
    //TESTE ONLY --- END

    //Chave de segurança
    setTimeout(function(){_('irsa').value = _passw.gen(40); _('irsa').disabled = false; _('irsa').placeholder="digite uma chave válida"}, 500);
    _('irsa').onkeypress = function (e) {return _passw.check(String.fromCharCode(e.charCode))}
    _('newkey').onclick = function (){_('irsa').value = _passw.gen(40);}

    //Botão de "ENTRADA/LOGIN"
    _('go').onclick = function(){
        USER.key = _('irsa').value;
        var login = _('login').value;
        var password = _('password').value;

        if(USER.key.length < 20) return _msg('Digite pelo menos 20 caracteres!');

        var js = JSON.stringify({login:login, password:password, asskey:USER.key})

        //convertendo...
        vk = RSA.encrypt(js, RSA.getPublicKey(key));
        _msg('Enviando dados criptgrafados ao servidor.<br>Aguarde...');

        AJAX = new lib.ajax();
        AJAX.set.url(URL+'login/checkUser');
        AJAX.set.data({key:vk});
        AJAX.set.complete(function(data){ console.log(data)
            var e = JSON.parse(AES.dec(data, USER.key));

            if(e) {
                USER.id = e.ID;
                USER.name = e.NAME;

                _('groups').innerHTML += mountList(e.li);

                //Start Web Socket
                startWs();

                //Destroy login
                _('formLogin').outerHTML = null;
                _('zumbi').style.display = 'block';

            } else {
                _msg('<b>Falhou!</b><br>Verifique os dados informados<br>ou recarregue a página e faça nova tentativa.', 5000);
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

var MSG = {

    show: function (data){
        console.log(data);
        if(data.type != 'msg') return;
        formMsg(data);
        SOUND.play('msgin');
        setTimeout(function(){_('page3').scrollTop = _('page3').scrollHeight;}, 400)
    }
}

//formata os dados para mostrar como MESSAGE
function formMsg(msg){
    var d = document.createElement('DIV');
    d.className = 'xmsgc'+(msg.userid == USER.id ? ' me':'');
    d.innerHTML = (msg.userid == USER.id ? '':'<h2>'+msg.name+'</h2>')
                    +'<span class="xmsgi"></span><div class="xmsg">'
                    +(msg.userid == USER.id ? '':'<img src="'+URL+'img/d'+getUserImg(msg.userid)+'.jpg">')
                    +msg.message.replace(/(  )/g, " &nbsp;")
                    +'<span>'+("undefined" !== typeof msg.date ? msg.date : dtime())+' '+'</span></div></div>';
    _('chat').insertBefore(d, null);
    return d;
}


function getUserImg(number){
    var s = number.toString().substr(-1);
    for(var i = 0; i <=9; i++){
        if(s == i.toString()) return i;
    }
    return 0;
}

function dtime(){
    var t = new Date();
    var d = t.getDay();
    var m = t.getMonth();
    var y = t.getFullYear();

    var h = t.getHours();
    var i = t.getMinutes();
    var s = t.getSeconds();

    d = d < 10 ? '0'+d : d;
    m = m < 10 ? '0'+m : m;
    h = h < 10 ? '0'+h : h;
    i = i < 10 ? '0'+i : i;
    s = s < 10 ? '0'+s : s;

    return y+'-'+m+'-'+d+' '+h+':'+i+':'+s;
}


function mountList(o){
    var a = '<ul>';
    for(var i in o){
        var n = o[i]['msg'];
        var t = o[i]['total'];
        var n = n > 0 ? ' (' +(n > 1 ? n+' novas)' : n+' nova)') : '';
        var t = t > 0 ? ''+(t > 1 ? t+'' : t+''):'';
        a += '<li id="lst'+i+'" onclick="getMsgGroup('+i+')">'+o[i]['name']+'<span>'+o[i]['title']+'<span class="total">'+t+'</span><span class="novas">'+n+'</span></span></li>';
        if("undefined" != typeof o[i]['content']) a += mountList(o[i]['content']);
    }
    return a + '</ul>';
}

function mountMsg(o){
    _('chat').innerHTML = '';

    for(var i in o){
        var msg = {
            type: o[i]['type'],
            message: o[i]['content'],
            channel: o[i]['group'],
            name: o[i]['name'],
            userid: o[i]['id'],
            date: o[i]['date']
        }
        formMsg(msg);
    }
    setTimeout(function(){_('page3').scrollTop = _('page3').scrollHeight;}, 400);
}

function getMsgGroup(g){
    AJAX.set.url(URL+'msg/getMsgGroup/');
    AJAX.set.data({enc:AES.enc(JSON.stringify({group:g}), USER.key), id:USER.id});
    AJAX.set.complete(function(data){
        var e = JSON.parse(AES.dec(data, USER.key));

        if(e) mountMsg(e);
        else  {
            _('chat').innerHTML = '';
            _msg('Nenhuma mensagem não lida.');
        }

        _('page3').scrollTop = _('page3').scrollHeight;

        USER.channel = g;
        PAGE = 2;
        gonext()
    })
    AJAX.send();
}

function getUserGroupStatus(){
    AJAX.set.url(URL+'msg/getUserGroupStatus');
    AJAX.set.data({enc:AES.enc(JSON.stringify({group:'nada'}), USER.key), id:USER.id});

    AJAX.set.complete(function(data){
        var e = JSON.parse(AES.dec(data, USER.key));

        if(e) _('groups').innerHTML = mountList(e.li);
        else _msg('Infelizmente a chave não confere!<br>Tente de novo ou entre em contato com o suporte técnico.');
    })
    AJAX.send();
}

function getMsgUser(u){
    alert('Mensagem privada para '+u+' ?!')
}

function getUserList(){
    AJAX.set.url(URL+'login/getUserList');
    AJAX.set.data({enc:AES.enc(JSON.stringify({group:'nada'}), USER.key), id:USER.id});

    AJAX.set.complete(function(data){
        var e = JSON.parse(AES.dec(data, USER.key));

        if(e) mountUserList(e);
        else _msg('Infelizmente a chave não confere!<br>Tente de novo ou entre em contato com o suporte técnico.');
    })
    AJAX.send();
}

function mountUserList(e){
    var d = '<ul>';
    for(var i in e){
        d += '<li id="user'+e[i].id+'" onclick="getMsgUser('+i+')">'+e[i].name+'</li>';
    }
    _('userList').innerHTML = d+'</ul>';
}

function goback(){
    if(PAGE == 2) {
        _('page1').className = 'page';
        _('page2').className = 'page tonext';

        _('goback').innerHTML = 'sair';
        _('gonext').innerHTML = 'grupos';

        PAGE = 1;
        _('text').innerHTML = 'Usuários';
        return getUserList();
    }

    if(PAGE == 3) {
        _('page2').className = 'page';
        _('page3').className = 'page tonext';

        _('goback').innerHTML = 'usuários';
        _('gonext').innerHTML = 'mensagens';

        PAGE = 2;
        _('text').innerHTML = 'Grupos';
        return getUserGroupStatus();
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
        return getUserGroupStatus();
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

function togglePass(){
    var  p = _('password');
    if(p.type == 'password') p.type = 'text';
    else p.type = 'password';
}