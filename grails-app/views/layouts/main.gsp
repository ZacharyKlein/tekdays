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
   <div id="header">
          <div id="userInfo">
               <g:isLoggedIn>
               Welcome, <g:loggedInUserInfo field="fullName" /> &nbsp;&nbsp; <a href="${request.contextPath}/">Home</a> &nbsp;&nbsp;  <link:profile username="${loggedInUserInfo(field:'username')}">Profile</link:profile> &nbsp;&nbsp;  <a href="${createLink(controller:'logout', action:'index')}">Logout</a>
               </g:isLoggedIn>
               <g:isNotLoggedIn>
               <g:link controller="login" action="auth">Login</g:link> &nbsp; or &nbsp; <g:link controller="tekUser" action="create">Sign Up</g:link>
               </g:isNotLoggedIn>
          </div>
    </div>
    <div id="wrapper">
        <!-- END:skin -->
          <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
          </div>
          <div class="logo">
          <g:isNotLoggedIn>
            <a href="${request.contextPath}/">
                <img src="${resource(dir:'images',file:'td_logo.png')}" alt="TekDays"/>
            </a>
          </g:isNotLoggedIn>
          <g:isLoggedIn>
            <a href="${request.contextPath}/">
                <img src="${resource(dir:'images',file:'td_logo_small.png')}" alt="TekDays"/>
            </a>
            <div id="navlinks">
                <p><a href="#"><button>General</button></a> <a href="#"><button>Event-related</button></a> <a href="#"><button>Links</button></a> <a href="#"><button>Go</button></a> <a href="#"><button>Here</button></a></p>
            </div>
          </g:isLoggedIn>
          </div>
          <g:layoutBody />
              </div>
          <div id="footer">
              <br/>
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
          </div>



  </body>
</html>

