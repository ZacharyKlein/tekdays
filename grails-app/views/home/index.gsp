<html>
  <head>
    <title>TekDays &rarr; Home</title>
	  <meta name="layout" content="main" />
    <gui:resources components="['tabView']" />
  </head>
  <body>
        <div id="indexBlurb">
        <h1 style="text-align:center;">Dashboard</h1>
        </div>

        <div id="indexSearch">
          <g:form controller="tekEvent" action="search">
            <label>Search:</label>
            <input id="query" type="text" name="query" />
            <input class="searchButton" type=submit value="Go" />
          </g:form><br />

        </div>
        <br/>
        <g:isLoggedIn>
        <div>
        <h1>Hey Guy. You're Great. You Volunteered For:</h1>
        <gui:tabView>
         <g:each in="${volunteerEvents}" var="event">
          <gui:tab label="${event.name}" active="true">
            <h1>${event.name}</h1>
            <p><g:link controller="dashboard" action="dashboard" id="${event.id}">Dashboard</g:link></p>
            <p>${event.description}</p>
            <g:if test="${event.currentUserTasks()}">
            <p><strong>You need to:</strong></p>
            <ul>
            <g:each in="${event.currentUserTasks()}" var="task">
            <li>${task.title}</li>
            </g:each>
            <br />
            </ul>
           </g:if>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <p><strong>Recent forum threads:</strong></p>
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div>
        <br />
        </g:isLoggedIn>
  </body>
</html>
