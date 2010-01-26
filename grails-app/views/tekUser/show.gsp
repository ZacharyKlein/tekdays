

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays | ${tekUserInstance.username}</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                 <fieldset>
                   <legend>${tekUserInstance.username}</legend>

                     <td:showAvatar username="${tekUserInstance.username}" height="80" width="80" />

                     <p>
                       ${tekUserInstance.profile?.bio}
                     </p>

                     <p>${tekUserInstance.profile?.fullName}</p>

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

