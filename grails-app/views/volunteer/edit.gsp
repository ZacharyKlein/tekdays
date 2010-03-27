

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="volunteers" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
        <title>TekDays &rarr; ${volunteerInstance?.event.name} - Volunteers</title>
    </head>
    <body>
    	<div class="nav">
				<span><g:link action="list" params="[slug:tekEventInstance.slug]">Volunteers</g:link></span> &nbsp; > &nbsp; ${volunteerInstance?.user.profile?.fullName ?: volunteerInstance?.user.username}
	    </div>
	    <br/>
        <fieldset>
            <h1>${volunteerInstance?.event.name} Volunteer: ${volunteerInstance?.user.profile?.fullName ?: volunteerInstance?.user.username}</h1>
                 <fieldset style="background:white">
                   <legend>Profile</legend>

                     <td:showAvatar username="${volunteerInstance?.user.username}" height="80" width="80" /><br/>

										 <a href="mailto:${volunteerInstance.user.email}">${volunteerInstance.user.email}</a>
                     <p><strong>${volunteerInstance?.user.profile?.fullName}</strong></p>

                     <p>
                       ${volunteerInstance?.user.profile?.bio}
                     </p>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

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
        </fieldset>
    </body>
</html>

