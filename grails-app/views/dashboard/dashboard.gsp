<html>
    <head>
        <title>TekDays &rarr; Event Dashboard</title>
        <gui:resources components="['richEditor', 'tabView', 'datePicker', 'accordion']" />
        <g:javascript library="prototype" />
        <meta name="layout" content="main" />
        <gui:resources components="['datePicker', 'accordion']" />

        <script type="text/javascript">
            function clearPost(e) {
                $('title').value='';
                $('notes').value='';
            }

            function showSpinner() {
                document.getElementById('spinner').style.display = 'inline';
                document.getElementById('error').style.display = 'none';
            }

            function hideSpinner() {
                document.getElementById('spinner').style.display = 'none';
                document.getElementById('error').style.display = 'none';
            }

        </script>
    </head>

    <body>
        
        <td:ifIsOrganizer id="${event?.id}">
        <g:if test="${event?.nonApprovedVolunteers()}">
            <div class="message">
                <strong>${event?.nonApprovedVolunteers()?.size()}   ${event?.nonApprovedVolunteers()?.size() > 1 ? 'volunteers' : 'volunteer'} waiting for approval. </strong> &nbsp; <link:volunteerList slug="${event?.slug}">View all</link:volunteerList>  &raquo;
            </div>
        </g:if>
        </td:ifIsOrganizer>

        <gui:tabView>
            <gui:tab label="Dashboard" active="true">
                <div style="border: 1px solid #ccc;background:white;padding:10px 5px 5px 5px; margin:5px 0 5px 0;">
                    <g:render template="eventDash" model="${[event:event]}" />
                    <g:render template="tasksDash" model="${['tasks':tasks]}" />
                    <g:render template="volunteerDash" model="${['volunteers':volunteers]}" />
                    <g:render template="forumDash" model="${[messages:messages]}" />
                    <g:render template="sponsorDash" model="${[sponsorships:sponsorships]}" />
                    <g:render template="attachmentDash" model="${[attachments:attachments]}" />
                </div>
            </gui:tab>

            <gui:tab label="Tasks">
                <g:render template="taskList" model="${[taskInstanceList: taskInstanceList, taskInstanceTotal: taskInstanceList.size(), event:event]}"/>
            </gui:tab>

            <gui:tab label="Volunteers">
                <g:render template="volunteers" model="${[volunteerInstanceList: volunteerInstanceList, event:event]}" />
            </gui:tab>

            <gui:tab label="Forum">
                <g:render template="/grails-app/views/shared/forum" model="${[forumTopics:forumTopics, forumCount:forumTopics.size()]}" />
            </gui:tab>

            <gui:tab label="Sponsors">
            </gui:tab>

            <gui:tab label="Files">
                <g:render template="/attachment/attachments" model="${[attachmentInstanceList:attachments, attachmentInstanceTotal:attachments.size(), event:event]}" />
            </gui:tab>

        </gui:tabView>

    </body>
</html>

