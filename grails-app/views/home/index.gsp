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
           <p><strong>Recent forum threads</strong> (<g:link controller="message" action="create" id="${event.id}">start one</g:link>)</p>
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
        <g:isNotLoggedIn>
            <div class="indexCell">
              <div class="box-outer">
                <div class="box-inner">
                  <h3>Find an Event on TekDays</h3>
                  <p>
                    See if there's a technical event in the works that strikes your fancy; 
                    if there is, you can volunteer to help, or just let the organizers know 
                    that you'd be interested in attending.  Everybody has a role to play.
                  </p>
                    <span class="buttons">
                      <g:link controller="tekEvent" action="list">Find an Event</g:link>
                    </span>
                  </div>
              </div>   
            </div>
            
            <div class="indexCell">
              <div class="box-outer">
                <div class="box-inner">
                  <h3>Organize an Event with TekDays</h3>
                  <p>
                    If you don't see anything that suits your interest and location, 
                    why not get the ball rolling?  It's easy to get started, and there may 
                    be others out there ready to get behind you to make it happen.
                  </p>
                    <span class="buttons">
                      <g:link controller="tekEvent" action="create">
                        Organize an Event
                      </g:link>
                    </span>
                  </div>
                </div>
                </div>   
          

            <div class="indexCell">
              <div class="box-outer">
                <div class="box-inner">
                  <h3>Sponsor an Event on TekDays</h3>
                  <p>
                    If you're part of a business or organization that is involved in 
                    technology, sponsoring an event on TekDays is a great way to let the 
                    community know that you're there and you're involved. 
                  </p>

                    <span class="buttons">
                      <g:link controller="sponsor" action="create">
                        Sponsor an Event
                      </g:link>
                    </span>
              </div>
            </div>
            </div>
        </g:isNotLoggedIn>
  </body>
</html>
