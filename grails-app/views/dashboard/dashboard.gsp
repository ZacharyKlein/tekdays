<html>
  <head>
    <title>TekDays &rarr; Event Dashboard</title>
    <gui:resources components="['richEditor', 'tabView']" />
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="nav">
        <span class="menuButton">
          <a class="home" href="${resource(dir:'')}"><button>Home</button></a>
        </span>
        <span class="menuButton">
          <link:newTask name="${event?.name?.toLowerCase().encodeAsHyphen()}">
            <button>New Task</button>
          </link:newTask>
        </span>
        <span class="menuButton">
          <link:newSponsorship name="${event?.name?.toLowerCase().encodeAsHyphen()}">
            <button>Add Sponsor</button>
          </link:newSponsorship>
        </span>
        <span class="menuButton">
          <link:sponsorshipList name="${event?.name?.toLowerCase().encodeAsHyphen()}">
            <button>Current Event Sponsors</button>
          </link:sponsorshipList>
        </span>
        <span class="menuButton">
          <link:allSponsors>
            <button>All Sponsors</button>
          </link:allSponsors>
        </span>
        <span class="menuButton">
          <link:registrations name="${event?.name?.encodeAsHyphen().toLowerCase()}">
            <button>Registrations</button>
          </link:registrations>
        </span>
    </div><p>&nbsp;</p>
  <gui:tabView>
    <gui:tab label="Event Details" active="true">
        <g:render template="event" model="${[event:event]}" />
    </gui:tab>
    <gui:tab label="Tasks">
        <g:render template="tasks" model="${['tasks':tasks]}" />
    </gui:tab>
    <gui:tab label="Volunteers">
        <g:render template="volunteers" model="${['volunteers':volunteers]}" />
    </gui:tab>
    <gui:tab label="Forum">
        <g:render template="messages" model="${[messages:messages]}" />
    </gui:tab>
    <gui:tab label="Sponsors">
        <g:render template="sponsors" model="${[sponsorships:sponsorships]}" />
    </gui:tab>
    <gui:tab label="Files">
        <g:render template="attachments" model="${[attachments:attachments]}" />
    </gui:tab>
</gui:tabView>
  </body>
</html>

