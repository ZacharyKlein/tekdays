<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet"
            href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon"
            href="${resource(dir:'images',file:'favicon.ico')}"
            type="image/x-icon" />
        <gui:resources components="['accordion', 'toolTip']"/>
        <g:layoutHead />
        <g:javascript library="application" />
    </head>

    <body class="yui-skin-sam">

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
                            Welcome, <g:loggedInUserInfo field="username" /> &nbsp;&nbsp; <a href="${request.contextPath}/">Home</a> &nbsp;&nbsp;  <link:profile username="${loggedInUserInfo(field:'username')}">Profile</link:profile> &nbsp;&nbsp;  <a href="${createLink(controller:'logout', action:'index')}">Logout</a>
                        </g:isLoggedIn>
                        <g:isNotLoggedIn>
                        <g:link controller="login" action="auth">Login</g:link> &nbsp; or &nbsp; <g:link controller="tekUser" action="create">Sign Up</g:link>
                        </g:isNotLoggedIn>
                    </div>
               
                </div>
            </div>
        </div>
     
        <div id="wrapper">

            <div id="spinner" class="spinner" style="display:none;">
              <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
            </div>

            <g:layoutBody />

            <div id="clear">&nbsp;</div>
        </div>
        <div id="footer">
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
        </div>

    </body>
</html>

