<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" 
          href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" 
          href="${resource(dir:'images',file:'favicon.ico')}" 
          type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />				
  </head>
  <!-- START:skin -->
  <body class="yui-skin-sam">
    <div id="wrapper">
        <!-- END:skin -->
          <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
          </div>
          <div class="logo">
            <img src="${resource(dir:'images',file:'td_logo.png')}" alt="TekDays"/>
           
          </div> 
           <g:isLoggedIn>
           Welcome, <g:loggedInUserInfo field="username" /> | <g:link controller="tekUser" action="show" id="${loggedInUserInfo(field:'id')}">Profile</g:link> | <a href="${createLink(controller:'logout', action:'index')}">Logout</a>
           </g:isLoggedIn>
           <g:isNotLoggedIn>
           <g:link controller="login" action="auth">Login</g:link> or <g:link controller="tekUser" action="create">Sign Up</g:link>
           </g:isNotLoggedIn>
          <g:layoutBody />
              </div>
          <div id="footer">
              <br/>
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
          </div>
    

    
  </body>	
</html>

