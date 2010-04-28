<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet"
            href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon"
            href="${resource(dir:'images',file:'favicon.ico')}"
            type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="prototype" />
         <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true_or_false&amp;key=ABQIAAAAXeAx6Va9xJMTHMkJ3KHQXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxT-UirBlgedQ5BoYGxWIWaEyBU3CQ" type="text/javascript"></script>

    </head>

    <body class="yui-skin-sam" onload="${pageProperty(name:'body.onload')}">

        <div id="headerBar">
          <div id="header">
            <div class="logo" style="float:left; padding-bottom:0">
              <a href="${request.contextPath}/">
                <img src="${resource(dir:'images',file:'td_logo_small.png')}" alt="TekDays" style="height:45px;"/>
              </a>
            </div>


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
        </div>

        <div id="wrapper">
            <div id="eventBanner">
              <link:eventHome slug="${tekEventInstance.slug}">
                <img src="${createLink(controller:'tekEvent', action:'displayBanner', params:[slug:tekEventInstance.slug])}" />
              </link:eventHome>
            </div>

            <div id="spinner" class="spinner" style="display:none;">
              <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
            </div>
            
						${createLinkTo(controller:'tekEvent', action:'displayBanner', params:[slug:tekEventInstance.slug])}
						
            <g:layoutBody />

            <div id="clear"> <td:displayAd /></div>
        </div>
        <div id="footer">
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
        </div>

    </body>
</html>

