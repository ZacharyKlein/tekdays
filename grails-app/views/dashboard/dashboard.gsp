<html>
  <head>
    <title>TekDays &rarr; Event Dashboard</title>
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
    </div>
    <div id="event" style='margin:10px 10px 10px 10px'>
      <g:render template="event" model="${[event:event]}" />
    </div>
    <div id="blurb" style='margin:10px 10px 10px 10px'>
      <g:render template="blurb" model="${[blurb:blurb, event:event]}" />
    </div>
    <div id="tasks" style='margin:10px 10px 10px 10px'>
      <g:render template="tasks" model="${['tasks':tasks]}" />
    </div>
    <div id="volunteers" style='margin:10px 10px 10px 10px'>
      <g:render template="volunteers" model="${['volunteers':volunteers]}" />
    </div>
    <div id="messages" style='margin:10px 10px 10px 10px'>
      <g:render template="messages" model="${[messages:messages]}" />
    </div>
    <div id="sponsors" style='margin:10px 10px 10px 10px'>
      <g:render template="sponsors" model="${[sponsorships:sponsorships]}" />
    </div>

    <div id="attachments" style='margin:10px 10px 10px 10px'>
      <g:render template="attachments" model="${[attachments:attachments]}" />

    </div>

    <g:if test="${event?.twitterId}">
      <div id="twitter" style='margin:10px 10px 10px 10px'>
        <g:render template="twitter" model="${[event:event]}" />
      </div>
    </g:if>
  </body>
</html>

