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

        <g:if test="${(organizerEvents) || (volunteerEvents) || (sponsorEvents)}">
          <h1>Hi, <g:loggedInUserInfo field="username" />.</h1>
          <br />
        </g:if>

         <g:if test="${sponsor}">
           <p id="grayBox"><strong>YOU ARE A REPRESENTATIVE FOR <link:showSponsor slug="${sponsor.slug}">${sponsor?.name.toUpperCase()}</link:showSponsor></strong></p>
         </g:if>
         <g:if test="${organizerEvents}">
        <div>
        <h2>Events You're Organizing</h2>
        <gui:tabView>
         <g:each in="${organizerEvents}" var="event" status="i">
          <gui:tab label="${event?.name}" active="${ i == 0 }">
            <h1>${event?.name}</h1>
            <p><link:dashboard  slug="${event?.slug}"><button>Dashboard</button></link:dashboard> <link:eventHome slug="${event?.slug}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd, yyyy" />
            <g:if test="${event.endDate}">
             - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" />
            </g:if>
             in ${event.city}</p>
            <p><strong>Tasks &nbsp;</strong> <link:newTask slug="${event?.slug}"><button>New Task</button></link:newTask> <link:allTasks slug="${event?.slug}"><button>All Tasks</button></link:allTasks></p>
            <g:each in="${event.currentUserTasks()}" var="task">
            <p class="minitask"><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></p>
            </g:each>
            <br />
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic slug="${event?.slug}"><button>New Thread</button></link:newTopic> <link:forum slug="${event?.slug}"><button>Event Forum</button></link:forum></p>
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
        <h2>Events You're Volunteering For</h2>
        <gui:tabView>
         <g:each in="${volunteerEvents}" var="event" status="i">
          <gui:tab label="${event?.name}" active="${ i == 0 }">
            <h1>${event?.name}</h1>
            <p><link:dashboard slug="${event?.slug}"><button>Dashboard</button></link:dashboard> <link:eventHome slug="${event?.slug}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd, yyyy" />
            <g:if test="${event.endDate}">
             - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" />
            </g:if>
             in ${event.city}</p>            <p><strong>Tasks assigned to you &nbsp;</strong> <link:allTasks slug="${event?.slug}"><button>All Tasks</button></link:allTasks></p>
           <g:if test="${event.currentUserTasks()}">
            <g:each in="${event.currentUserTasks()}" var="task">
            <p class="minitask"><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></p>
            </g:each>
            <br />
           </g:if>
           <g:else>
             <p>No tasks are assigned to you, lazy.</p>
           </g:else>
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic slug="${event?.slug}"><button>New Thread</button></link:newTopic> <link:forum slug="${event?.slug}"><button>Event Forum</button></link:forum></p>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          <g:else>
          <p>No threads recently. You can <link:newTopic slug="${event?.slug}">start a new one</link:newTopic>...</p>
          </g:else>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div><br/ >
        </g:if>
<g:if test="${sponsorEvents}">
      <div>
        <h2>Events You're Sponsoring</h2>
        <gui:tabView>
         <g:each in="${sponsorEvents}" var="event" status="i">
                   <gui:tab label="${event?.name}" active="${ i == 0 }">
            <h1>${event?.name}</h1>
            <p><link:dashboard slug="${event?.slug}"><button>Dashboard</button></link:dashboard> <link:eventHome slug="${event?.slug}"><button>Homepage</button></link:eventHome></p>
            <p class="homesum"><g:formatDate date="${event.startDate}" format="EEEEE, MMMM dd, yyyy" />
            <g:if test="${event.endDate}">
             - <g:formatDate date="${event.endDate}" format="EEEEE, MMMM dd, yyyy" />
            </g:if>
             in ${event.city}</p>            <p><strong>Tasks assigned to you &nbsp;</strong> <g:link controller="task" action="list" id="${event.id}"><button>All Tasks</button></g:link></p>
           <g:if test="${event.currentUserTasks()}">
            <g:each in="${event.currentUserTasks()}" var="task">
            <p class="minitask"><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></p>
            </g:each>
            <br />
           </g:if>
           <g:else>
             <p><strong>No tasks are assigned to you.</strong></p>
           </g:else>
           <p><strong>Recent forum threads &nbsp;</strong> <link:newTopic slug="${event?.slug}"><button>New Thread</button></link:newTopic> <link:forum slug="${event?.slug}"><button>Event Forum</button></link:forum></p>
           <g:if test="${Message.findAllByEventAndParentIsNull(event)}">
           <g:each in="${Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])}" var="msg">
            <p><g:link controller="message" action="topic" id="${msg.id}"><em>${msg.subject}</em></g:link> by ${msg.author} on <g:formatDate date="${msg.dateCreated}" format="MMMMM dd" /> at <g:formatDate date="${msg.dateCreated}" format="HH:MM a" /></p>
           </g:each>
          </g:if>
          <g:else>
          <p>No threads recently. You can <link:newTopic slug="${event?.slug}">start a new one</link:newTopic>...</p>
          </g:else>
          </gui:tab>
          </g:each>
        </gui:tabView>
        </div><br/ >
        </g:if>
        <g:if test="${(!organizerEvents) && (!volunteerEvents) && (!sponsorEvents)}">
          <p id="grayBox">
          This is some text telling you that you haven't done anything yet. So what are you waiting for? Go and do something!
          </p>
        </g:if>
        </g:isLoggedIn>
  </body>
</html>

