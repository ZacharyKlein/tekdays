<head>
<meta name='layout' content='main' />
<title>TekDays &rarr; Login</title>
</head>
<body>
  <form action='${postUrl}' method='POST' id='loginForm'>
    <fieldset>
      <legend>Please Login..</legend>
      <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
      </g:if>
      <p>
        <label for='j_username' class="loginlabel">Username</label>
        <input type='text' class='logininput' name='j_username' id='j_username' value='${request.remoteUser}' />
      </p>
      <p>
        <label for='j_password' class="loginlabel">Password</label>
        <input type='password' class='logininput' name='j_password' id='j_password' />
      </p>
      <p>
        <input type='submit' value='Login' />
      </p>
    </fieldset><br />
   </form>
</body>
