<html>
  <head>
    <title>TekDays &rarr; Home</title>
	  <meta name="layout" content="main" />
    <gui:resources components="['tabView']" />
  </head>
  <body>


        <div id="indexBlurb">
            <g:isNotLoggedIn>
                <h1>THIS PAGE IS DISGUSTING</h1>
                <h2>please get it changed</h2>
                <p id="intro">Helping individuals and communities
                      organize <br/>cutting edge technology conferences<br/>
                  <span id="sub"><em>bringing great minds with common
                        interests and passions together for the good of greater geekdom!</em>
                  </span>
                </p>
            </g:isNotLoggedIn>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        </div>
        <br/>
        <g:isLoggedIn>
         <g:if test="${sponsor}">
           <p id="isSponsor"><strong>YOU ARE A SPONSOR FOR <g:link controller="sponsor" action="show" id="${sponsor.id}">${sponsor?.name.toUpperCase()}</g:link></strong></p>
         </g:if>
         <g:if test="${organizerEvents}">
        <div>
        <h1>Events You're Organizing</h1>
        <gui:tabView>
         <g:each in="${organizerEvents}" var="event">
          <gui:tab label="${event?.name}" active="true">
            <h1>${event?.name}</h1>
            <p><link:dashboard name="${event?.name.toLowerCase().encodeAsHyphen()}"><button>Dashboard</button></link:dashboard> <link:eventHome name="${event?.name.toLowerCase().encodeAsHyphen()}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd" /> - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" /> in ${event.city}</p>
            <p><strong>Tasks &nbsp;</strong> <link:newTask name="${event?.name.toLowerCase().encodeAsHyphen()}"><button>New Task</button></link:newTask> <link:allTasks name="${event?.name.toLowerCase().encodeAsHyphen()}"><button>All Tasks</button></link:allTasks></p>
            <g:each in="${event.currentUserTasks()}" var="task">
            <p class="minitask"><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></p>
            </g:each>
            <br />
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic name="${event?.name.encodeAsHyphen()}"><button>New Thread</button></link:newTopic> <link:forum name="${event?.name.encodeAsHyphen()}"><button>Event Forum</button></link:forum></p>
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
          <gui:tab label="${event?.name}" active="true">
            <h1>${event?.name}</h1>
            <p><link:dashboard name="${event?.name.encodeAsHyphen()}"><button>Dashboard</button></link:dashboard> <link:eventHome name="${event?.name.encodeAsHyphen().toLowerCase()}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd" /> - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" /> in ${event.city}</p>
            <p><strong>Tasks assigned to you &nbsp;</strong> <g:link controller="task" action="list" id="${event.id}"><button>All Tasks</button></g:link></p>
           <g:if test="${event.currentUserTasks()}">
            <ul>
            <g:each in="${event.currentUserTasks()}" var="task">
            <li><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></li>
            </g:each>
            <br />
            </ul>
           </g:if>
           <g:else>
             <p>No tasks are assigned to you, lazy.</p>
           </g:else>
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic name="${event?.name.encodeAsHyphen()}"><button>New Thread</button></link:newTopic> <link:forum name="${event?.name.encodeAsHyphen()}"><button>Event Forum</button></link:forum></p>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          <g:else>
          <p>No threads recently. You can <link:newTopic name="${event?.name.encodeAsHyphen()}">start a new one</link:newTopic>...</p>
          </g:else>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div><br/ >
        </g:if>
<g:if test="${sponsorEvents}">
      <div>
        <h1>Events You're Sponsoring</h1>
        <gui:tabView>
         <g:each in="${sponsorEvents}" var="event">
                   <gui:tab label="${event?.name}" active="true">
            <h1>${event?.name}</h1>
            <p><link:dashboard name="${event?.name.encodeAsHyphen()}"><button>Dashboard</button></link:dashboard> <link:eventHome name="${event?.name.encodeAsHyphen()}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd" /> - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" /> in ${event.city}</p>
            <p><strong>Tasks assigned to you &nbsp;</strong> <g:link controller="task" action="list" id="${event.id}"><button>All Tasks</button></g:link></p>
           <g:if test="${event.currentUserTasks()}">
            <ul>
            <g:each in="${event.currentUserTasks()}" var="task">
            <li><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></li>
            </g:each>
            <br />
            </ul>
           </g:if>
           <g:else>
             <p><strong>No tasks are assigned to you.</strong></p>
           </g:else>
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic name="${event?.name.encodeAsHyphen()}"><button>New Thread</button></link:newTopic> <link:forum name="${event?.name.encodeAsHyphen()}"><button>Event Forum</button></link:forum></p>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          <g:else>
          <p>No threads recently. You can <link:newTopic name="${event?.name.encodeAsHyphen()}">start a new one</link:newTopic>...</p>
          </g:else>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div><br/ >
        </g:if>
        </g:isLoggedIn>
  </body>
</html>

