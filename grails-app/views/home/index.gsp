<html>
  <head>
    <title>TekDays &rarr; Home</title>
    <meta name="layout" content="main" />
    <tm:resources />
    <g:javascript library="prototype" />
  </head>
  
<body>
    <g:if test="${flash.message}">
      <div id="transparentMsg">
        ${flash.message}
      </div>
    </g:if>
    <br/>

    <div id="userHomeContent">
      <div id="userHomeInfo">
        <img class="avatar" src="${createLink(controller:'tekUser', action:'displayAvatar', params:[username:user.username])}" />
        <div style="float:right;">
          <h2>${message(code:'home.loggedin.hello')}, <td:displayUserName id="${user?.id}" />...</h2>
          <p>${message(code:'home.loggedin.joined')}: <g:formatDate date="${user?.dateCreated}" format="MM/dd/yyyy" /> (<prettytime:display date="${user?.dateCreated}" />)</p>
        </div>
      </div>
        <div id="userNav">
          <g:link controller="tekEvent" action="search">Search Events</g:link> 
          <g:link controller="tekEvent" action="create">Start Event</g:link>
          <g:if test="${!sponsor}"> 
            <span style="float:right"><g:link controller="sponsor" action="create">Become a Sponsor!</g:link></span>
          </g:if>
          <g:else>
           <span style="float:right"><link:showSponsor slug="${sponsor.slug}">Sponsor Home Page</link:showSponsor></span>
          </g:else>
        </div>							
	
        <div id="associatedEvents">						
					

        <span id="help_1">
          <td:helpBox id="1">
            <div>
              <img src="${resource(dir:'images', file:'help.png')}" style="float:right" />
              <h3>${message(code:'home.loggedin.associated.heading')}</h3>
              <p>${message(code:'home.loggedin.associated.desc')} &nbsp; &nbsp;
                <g:remoteLink controller="tekUser" action="hideHelp" id="1" update="help_1" onLoading="showSpinner();">
                  ${message(code:'home.loggedin.associated.hide')}
                </g:remoteLink>
              </p>
            </div>
          </td:helpBox>
        </span>
    
        <g:if test="${(!organizerEvents) && (!volunteerEvents) && (!sponsorEvents)}">
          <g:render template="noEvents" />
        </g:if>
        <g:else>
          <g:render template="aEvents" model="[organizerEvents:organizerEvents, volunteerEvents:volunteerEvents, sponsoredEvents:sponsoredEvents]" />
        </g:else>
      </div>
      
    </div>

    <div id="userHomeSecondaryContent">
      <h2>${message(code:'home.loggedin.pending.heading')}</h2>
      <span id="help_2">
        <td:helpBox id="2">
          <div style="padding:10px; background:white; border: 1px solid #ccc; margin-bottom:25px;">
          <img src="${resource(dir:'images', file:'help-small.png')}" style="float:right" />
          
          <p>${message(code:'home.loggedin.pending.desc')} &nbsp; &nbsp; &nbsp; &nbsp;
            <g:remoteLink controller="tekUser" action="hideHelp" id="2" update="help_2" onLoading="showSpinner();">
              ${message(code:'home.loggedin.pending.hide')}
            </g:remoteLink>
          </p>
          </div>
        </td:helpBox>
      </span>

      <div style="padding:10px; /*background:white; border: 1px solid #ccc;*/ margin-bottom:25px;">
        <td:pendingItems />         
      </div>
        
    </div>
  </body>
</html>

