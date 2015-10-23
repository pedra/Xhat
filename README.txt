## COMO FUNCIONA A AUTENTICA��O SEGURA (login)?

[browser]
	Ao acessar, o servidor envia a p�gina HTTP com uma chave p�blica {PKEY} inclu�da no javascript.
	O usu�rio insere o login, a senha e uma chave de 40 caracteres {SKEY} que � gerada (ou digitada).
	Esses dados s�o criptografados pela chave p�blica {PKEY} (enviada pelo servidor) e o c�digo gerado � enviado ao servidor.

[servidor]
	O c�digo (criptografado) recebido � decriptado pela chave privada {RKEY} do servidor. 
	Os dados de login (login + senha) s�o checados no banco de dados da forma tradicional:
	[no] = retorna login false!
	[ok] = um registro no banco de dados armazena a chave s�ncrona {SKEY} enviada pelo browser.
	Dados do usu�rio (nome, id, etc) s�o encriptados com a chave s�ncrona {SKEY} e enviado ao browser.

[browser]
	O c�digo recebido � decriptado pela chave s�ncrona {SKEY}:
	[no] = login falhou! Recarrega a p�gina.
	[ok] = recupera os dados do usu�rio e estabelece o login.
	Todas as comunica��es, a partir de agora entre browser e servidor, ser�o (de)codificadas pela chave s�ncrona {SKEY}.
	A cada tr�s (3) minutos uma nova chave {SKEY} ser� gerada no browser e, autom�ticamente, trocada no servidor (via socket), garantindo ainda mais seguran�a.

## COMO INSTALAR PARA TESTAR

[ambiente]
	PHP 5.4+
	MySQL 5.5+
	Apache 2.4+ [opcional]
	Um canal livre para o socket (8080, default)

[instalar]
	Verifique o arquivo "install.php" (linha 26) e configure o acesso correto ao seu MySQL.
	Acesse: http://localhost/install.php para criar o banco de dados.

[rodar]
	Em um terminal inicie o relay: php [path_to_zumbi]/.app/relay.php -s
	Acesse: http://localhost/zumbi  [ou o endere�o de acesso ao "zumbi"]
	A senha � sempre "1234567890" e uma lista de e-mails para o campo "login" pode ser vista na pr�pria p�gina.
	Preencha os campos solicitados e click no bot�o "Enviar".

[obs: essa � uma vers�o incompleta de teste, apenas]    
			
