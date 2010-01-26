

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

                     <td:showAvatar username="${tekUserInstance.username}" height="80" width="80" />

                     <p><strong>${tekUserInstance.profile?.fullName}</strong></p>

                     <p>
                       ${tekUserInstance.profile?.bio}
                     </p>

                    <g:if test="${organizerEvents}">
                     <p>
                     <strong>Events ${tekUserInstance.username} is organizing</strong>
                       <ul>
                        <g:each in="${organizerEvents}" var="event">
                          <li><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></li>
                        </g:each>
                       </ul>
                     </p>
                     </g:if>

		            <br />
                     <g:form>
                    <input type="hidden" name="username" value="${tekUserInstance?.username}" />
                    <input type="hidden" name="id" value="${tekUserInstance?.id}" />
                    <td:profileChange ownerId="${tekUserInstance.id}" >
                    <span class="button"><g:link class="edit" action="edit" id="${tekUserInstance.id}" value="Edit Profile" >Edit Profile</g:link></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>

                    </td:profileChange>
                </g:form>
                 </fieldset><br />
        </div>
    </body>
</html>

