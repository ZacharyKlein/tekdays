<html>
  <head>
    <title>TekDays &rarr; Home</title>
	  <meta name="layout" content="main" />
    <gui:resources components="['tabView']" />
  </head>
  <body>


        <div id="indexBlurb">
            <g:isNotLoggedIn>
                <p id="intro">Helping individuals and communities 
                      organize <br/>cutting edge technology conferences<br/>
                  <span id="sub">bringing great minds with common 
                        interests and passions together for the good of greater geekdom!  
                  </span>
                </p>
            </g:isNotLoggedIn>
            <g:isLoggedIn>
                <h1 style="text-align:center;">Dashboard</h1>
            </g:isLoggedIn>
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
         <g:if test="${organizerEvents}">
        <div>
        <h1>Events You're Organizing</h1>
        <gui:tabView>
         <g:each in="${organizerEvents}" var="event">
          <gui:tab label="${event.name}" active="true">
            <h1>${event.name}</h1>
            <p><g:link controller="dashboard" action="dashboard" id="${event.id}"><button>Dashboard</button></g:link> <link:eventShowWId id="${event.id}"><button>Homepage</button></link:eventShowWId></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd" /> - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" /> in ${event.city}</p>
            <p><strong>Tasks &nbsp;</strong> <g:link controller="task" action="create" id="${event.id}"><button>New Task</button></g:link> <g:link controller="task" action="list" id="${event.id}"><button>All Tasks</button></g:link></p>
            <ul>
            <g:each in="${event.tasks}" var="task">
            <li><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></li>
            </g:each>
            <br />
            </ul>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <p><strong>Recent forum threads &nbsp;</strong> <g:link controller="message" action="create" id="${event.id}"><button>New Thread</button></g:link></p>
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div>
        <br />
      </g:if>
      <g:if test="${volunteerEvents}">
      <div>
        <h1>Events You're Volunteering For</h1>
        <gui:tabView>
         <g:each in="${volunteerEvents}" var="event">
          <gui:tab label="${event.name}" active="true">
            <h1>${event.name}</h1>
            <p><g:link controller="dashboard" action="dashboard" id="${event.id}"><button>Dashboard</button></g:link> <link:eventShowWId id="${event.id}"><button>Homepage</button></link:eventShowWId></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd" /> - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" /> in ${event.city}</p>
            <g:if test="${event.currentUserTasks()}">
            <p><strong>Tasks assigned to you &nbsp;</strong> <g:link controller="task" action="list" id="${event.id}"><button>All Tasks</button></g:link></p>
            <ul>
            <g:each in="${event.currentUserTasks()}" var="task">
            <li><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></li>
            </g:each>
            <br />
            </ul>
           </g:if>
           <p><strong>Recent forum threads &nbsp;</strong> <g:link controller="message" action="create" id="${event.id}"><button>New Thread</button></g:link></p>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          <g:else>
          <p>No threads recently. You can <a href="${createLink(controller:'message', action:'create', id:event.id)}">start a new one</a>...</p>
          </g:else>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div><br/ >
        </g:if>
        </g:isLoggedIn>
  </body>
</html>
