<head>
<meta name='layout' content='main' />
<title>TekDays &rarr; Login</title>
<style type="text/css" media="screen">
label.login {
  font-size:1.2em;
  display:block;
}

label.remember {
  font-size:1.2em;
}

input.login {
  font-size:1.6em;
  width:300px;
  color:#FF6A00;
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
</style>
</head>
<body>
  <form action='${postUrl}' method='POST' id='loginForm'>
   <div class="lgd" align="center">
   <br />
    <fieldset class="login">
      <legend>Please Login..</legend>
      <p>Don't have an account? <a href="${createLink(controller:'tekUser', action:'create')}">Sign up</a>!</p>
      <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
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
</body>
