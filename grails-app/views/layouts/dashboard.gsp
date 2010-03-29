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
              <img src='<g:resource dir="${tekEventInstance.bannerLocation}" file="${tekEventInstance.bannerName}" />' />
            </link:eventHome>
          </div>

					<div id="dashboardContent">
            <div id="spinner" class="spinner" style="display:none;">
              <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner"/>
            </div>
            <g:layoutBody />
					</div>

					<div id="dashboardSecondaryContent">
						<ul>
							<li id="${pageProperty(name:'meta.dashTab')=='home' ? 'current' : ''}" >
								<g:link controller="dashboard" action="dashboard" params="[slug:tekEventInstance.slug]">
									Dashboard Home
								</g:link>
							</li>
							<li id="${pageProperty(name:'meta.dashTab')=='tasks' ? 'current' : ''}" >
								<g:link controller="task" action="list" params="[slug:tekEventInstance.slug]">
									Tasks
								</g:link>
							</li>
							<li id="${pageProperty(name:'meta.dashTab')=='volunteers' ? 'current' : ''}" >
								<g:link controller="volunteer" action="list" params="[slug:tekEventInstance.slug]">
									Volunteers
								</g:link>
							</li>
							<li id="${pageProperty(name:'meta.dashTab')=='forum' ? 'current' : ''}" >
								<g:link controller="message" action="forum" params="[slug:tekEventInstance.slug]">
									Forum
								</g:link>
							</li>
							<li id="${pageProperty(name:'meta.dashTab')=='sponsors' ? 'current' : ''}" >
								<link:sponsorshipList slug="${tekEventInstance.slug}">
									Sponsors
								</link:sponsorshipList>
							</li>
							<li id="${pageProperty(name:'meta.dashTab')=='files' ? 'current' : ''}" >
								<g:link controller="attachment" action="list" params="[slug:tekEventInstance.slug]">
									Files
								</g:link>
							</li>
<!--							<li id="${pageProperty(name:'meta.dashTab')=='dates' ? 'current' : ''}" >
								<g:link controller="tekEvent" action="edit" params="[slug:tekEventInstance.slug]">
									Event Dates
								</g:link>
							</li>-->
							<li id="${pageProperty(name:'meta.dashTab')=='edit' ? 'current' : ''}" >
								<g:link controller="tekEvent" action="edit" params="[slug:tekEventInstance.slug]">
									Edit Event
								</g:link>
							</li>
						</ul>
					</div>

          <div class="clear">&nbsp;</div>
        </div>
        <div id="footer">
              <p>Copyright 2009 by <a href="http://www.silver-chalice.com">Silverchalice</a></p>
        </div>

    </body>
</html>

