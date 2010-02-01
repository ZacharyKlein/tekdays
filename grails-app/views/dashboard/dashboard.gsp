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

            function showSpinner() {
                document.getElementById('spinner').style.display = 'inline';
                document.getElementById('error').style.display = 'none';
            }

            function hideSpinner() {
                document.getElementById('spinner').style.display = 'none';
                document.getElementById('error').style.display = 'none';
            }

        </g:javascript>
    </head>

    <body>

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
                <g:render template="volunteers" model="${[volunteerInstanceList: volunteerInstanceList, event:event]}" />
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

