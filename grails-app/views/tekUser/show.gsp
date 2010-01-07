

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays | ${tekUserInstance.username}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <g:ifAllGranted role="ROLE_ADMIN">
                <span class="menuButton"><g:link class="list" action="list">All Users</g:link></span>
            </g:ifAllGranted>
            <g:isNotLoggedIn>
                <span class="menuButton"><g:link class="create" action="create">Register</g:link></span>
            </g:isNotLoggedIn>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                 <fieldset>
                   <legend>${tekUserInstance.username}</legend>

                     <p>
                       ${tekUserInstance.profile?.bio}
                     </p>
                     
                     <p>${tekUserInstance.profile?.fullname}</p>

		     <br />
                     <g:form>
                    <input type="hidden" name="username" value="${tekUserInstance?.profile?.username}" />
                    <td:profileChange ownerId="${tekUserInstance.id}" >
                    <span class="button"><g:actionSubmit class="edit" action="edit" id="${tekUserInstance.id}" username="${tekUserInstance.username}" value="Edit Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Are you sure?');" value="Delete this account" /></span>
                    </td:profileChange>
                </g:form>
                 </fieldset><br />
        </div>
    </body>
</html>

