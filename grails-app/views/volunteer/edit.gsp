

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title>TekDays &rarr; ${volunteerInstance?.event.name} - Volunteers</title>
    </head>
    <body>
        <div class="body">
            <h1>${volunteerInstance?.event.name} Volunteer: ${volunteerInstance?.user.profile?.fullName ?: volunteerInstance?.user.username}</h1>
                 <fieldset>
                   <legend>${volunteerInstance?.user.username}</legend>

                     <td:showAvatar username="${volunteerInstance?.user.username}" height="80" width="80" />

                     <p><strong>${volunteerInstance?.user.profile?.fullName}</strong></p>

                     <p>
                       ${volunteerInstance?.user.profile?.bio}
                     </p>
                 </fieldset>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <fieldset>
            <g:form method="post" >
                <g:hiddenField name="id" value="${volunteerInstance?.id}" />
                <g:hiddenField name="version" value="${volunteerInstance?.version}" />
                <div class="dialog">
                    <p>
                        <label for="active">Approved:</label>
                        <g:checkBox name="active" value="${volunteerInstance?.active}" />
                    </p><br />
                </div>
                <div>
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <!--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>-->
                </div>
            </g:form>
        </div>
    </body>
</html>

