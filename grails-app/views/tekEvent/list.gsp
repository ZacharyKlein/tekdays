<html>
<!-- START:headSection -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>TekDays &rarr; Events</title>
  </head>
<!-- END:headSection-->  
  <body>
    <div class="nav">
      <span class="menuButton">
        <a class="home" href="${resource(dir:'')}">Home</a>
      </span>
      <span class="menuButton">
        <g:link class="create" action="create">Start An Event</g:link>
      </span>
    </div>
    <div class="body">
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="tekEventList">

            <g:each in="${tekEventInstanceList}" status="i" 
                                                 var="tekEventInstance">
              <!-- START:body -->
                                                 
              <div class="tekEventListItem">
                <g:link action="show" id="${tekEventInstance.id}">
                    <h2>${tekEventInstance.name}</h2>
                  </g:link>
		<br/>
		<p class="location">${tekEventInstance.city} -  ${tekEventInstance.venue}</p>
                <p>${fieldValue(bean:tekEventInstance, field:'description')}</p>
               <br/>
              </div>
            </g:each>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${tekEventInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
