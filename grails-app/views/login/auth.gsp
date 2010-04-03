<head>
<meta name='layout' content='main' />
<tm:resources />
<title>TekDays &rarr; Login</title>
<style type="text/css" media="screen">
label.login {
  font-size:1.2em;
  display:block;
}

.login_message {
  background: #fff3f3;
  border: 1px solid red;
  color: #cc0000;
  margin: 10px 0 5px 0;
  padding: 5px 0 5px 0;
  padding-left:10px;
}

label.remember {
  font-size:1.2em;
}

input.login {
  font-size:1.6em;
  width:300px;
  color:#DBB237;
}

fieldset.login {
  max-width:31em;
  margin-left:230;
}

.lgd {
  text-align:left;
}

#userInfo {
  display:none;
}

input[type=submit].login {
  font-size:1.2em;
  color:black;
  width:5em;
}

input.chk {
  color:#FF6A00;
}

p#exp {
    font-size:10px;
}

p#exp a {
    font-size:10px;
}
</style>
</head>
<body>
        <div class="logo">
            <a href="${request.contextPath}/">
                <img src="${resource(dir:'images',file:'td_logo.png')}" alt="TekDays"/>
            </a>
            </div>
  <form action='${postUrl}' method='POST' id='loginForm'>
   <div class="lgd" align="center">
   <br />
    <fieldset class="login">
      <legend>Please Login..</legend>
      <p id="exp">If you do not have an account, we hereby command you to <a href="${createLink(controller:'tekUser', action:'create')}">SIGN UP</a>.</p>
      <g:if test='${msg}'>
        <%--<div class='login_message'>${msg}</div>--%>
        <div id="transparentMsg">${msg}</div>
      </g:if>
      <p>
        <label for='j_username' class="login">Username</label>
        <input type='text' class='login' name='j_username' id='j_username' value='${request.remoteUser}' />
      </p>
      <p>
        <label for='j_password' class="login">Password</label>
        <input type='password' class='login' name='j_password' id='j_password' />
      </p>
      <p>
        <label for='remember_me' class="remember">Remember me?</label>
        <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
        <g:if test='${hasCookie}'>checked='checked'</g:if> />
      </p>
      <p>
        <input type='submit' class="login" value='Login' />
      </p>
    </fieldset><br />
   </div>
   </form>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>

