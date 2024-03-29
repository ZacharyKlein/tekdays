<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet"
          href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon"
          href="${resource(dir:'images',file:'favicon.ico')}"
          type="image/x-icon" />
    <g:layoutHead />

  </head>
  <!-- START:skin -->
  <body class="yui-skin-sam">
     <div id="headerBar">
	     <div id="header">
	       <g:isLoggedIn>
	        <a href="${request.contextPath}/">
	            <img src="${resource(dir:'images',file:'td_logo_small.png')}" style='float:left; border:none;' alt="TekDays"/>
	        </a>
        </g:isLoggedIn>

			  <div id="headrightwrap">
          <div id="userInfo">
            <g:isLoggedIn>
              Welcome, <g:loggedInUserInfo field="username" /> &nbsp;&nbsp; <a href="${request.contextPath}/">Home</a> &nbsp;&nbsp;
							<link:profile username="${loggedInUserInfo(field:'username')}">Profile</link:profile> &nbsp;&nbsp;
							<a href="${request.contextPath}/feedback">Leave feedback</a> &nbsp;&nbsp;
							<a href="${createLink(controller:'logout', action:'index')}">Logout</a>
            </g:isLoggedIn>
            <g:isNotLoggedIn>
              <g:link controller="login" action="auth">Login</g:link> &nbsp; or &nbsp; <g:link controller="tekUser" action="create">Sign Up</g:link>
            </g:isNotLoggedIn>
          </div>
          
          <div id="search">
            <g:form controller="tekEvent" action="search" style="margin: 0; padding: 0">
            <input id="query" type="text" name="query" value="Search for events..."/>
            <input id="searchButton" type=submit value="Go" onfocus="this.select()" />
            </g:form>
          </div>
        </div>
	        
	    </div>
	    <div class="clear"></div>
    </div>

    <div id="wrapper">
        <!-- END:skin -->
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
        </div>
            <g:layoutBody />
            <div class="clear"> <td:displayAd /></div>
        </div>

        <div id="footer">
              <p><g:message code="home.copyright" /> <a href="http://www.silver-chalice.com">Silverchalice</a></p>
        </div>

    </div>

  </body>
</html>

