<html>
    <head>
        <title>TekDays &rarr; Event Dashboard</title>
        <gui:resources components="['richEditor', 'tabView', 'datePicker', 'accordion']" />
        <g:javascript library="prototype" />
        <meta name="layout" content="main" />
        <gui:resources components="['datePicker', 'accordion']" />

        <g:javascript>
            function clearPost(e) {
                $('title').value='';
                $('notes').value='';
            }
            function showSpinner(visible) {
                $('spinner').style.display = visible ? "inline" : "none";
            }
        </g:javascript>
    </head>

    <body>
        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${resource(dir:'')}"><button>Home</button></a>
            </span>
            <span class="menuButton">
              <link:newSponsorship slug="${event?.slug}">
                <button>Add Sponsor</button>
              </link:newSponsorship>
            </span>
            <span class="menuButton">
              <link:sponsorshipList slug="${event?.slug}">
                <button>Current Event Sponsors</button>
              </link:sponsorshipList>
            </span>
            <span class="menuButton">
              <link:allSponsors>
                <button>All Sponsors</button>
              </link:allSponsors>
            </span>
            <span class="menuButton">
              <link:registrations slug="${event?.slug}">
                <button>Registrations</button>
              </link:registrations>
            </span>
        </div>
        <p>&nbsp;</p>
        <gui:tabView>
            <gui:tab label="Dashboard" active="true">
                <g:render template="eventDash" model="${[event:event]}" />
                <g:render template="tasksDash" model="${['tasks':tasks]}" />
                <g:render template="volunteerDash" model="${['volunteers':volunteers]}" />
                <g:render template="forumDash" model="${[messages:messages]}" />
                <g:render template="sponsorDash" model="${[sponsorships:sponsorships]}" />
                <g:render template="attachmentDash" model="${[attachments:attachments]}" />
            </gui:tab>
            
            <gui:tab label="Tasks">
                <g:render template="taskList" model="${[taskInstanceList: taskInstanceList, taskInstanceTotal: taskInstanceList.size(), event:event]}"/>
            </gui:tab>
            
            <gui:tab label="Volunteers">
            </gui:tab>
            
            <gui:tab label="Forum">
            </gui:tab>
            
            <gui:tab label="Sponsors">
            </gui:tab>
            
            <gui:tab label="Files">
            </gui:tab>
            
        </gui:tabView>
    </body>
</html>

