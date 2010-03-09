

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
                 <fieldset id="profile">
                    <legend>${tekUserInstance.username}</legend>

                    <td:showAvatar username="${tekUserInstance.username}" height="80" width="80" />

                    <div id="userStuff" style="margin-left:140px;">
                        <g:if test="${tekUserInstance.profile?.fullNameShow}">
                          <p><strong>${tekUserInstance.profile?.fullName}</strong></p>
                        </g:if>
                        <g:if test="${tekUserInstance?.profile?.bio}">
                            <p style="padding:5px; background:white; border: 1px solid #ccc; min-height:65px;">
                                ${tekUserInstance.profile?.bio}
                            </p>
                        </g:if>
                        <g:else>
                            <br />
                        </g:else>
                    </div>
                    <g:if test="${organizerEvents}">
                    <div style="background:white; border:1px solid #ccc; margin-top:80px; padding:10px">
                        <strong>Events ${tekUserInstance.username} is organizing</strong>
                        <ul>
                            <g:each in="${organizerEvents}" var="event">
                                <li style="padding:20px; background:#f8f8f8; border:1px solid #303030; margin:10px;"><link:eventHome slug="${event?.slug}">${event?.name}</link:eventHome></li>
                            </g:each>
                        </ul>
                    </div>
                    </g:if>

		            <br />
                     <g:form>
                    <input type="hidden" name="username" value="${tekUserInstance?.username}" />
                    <input type="hidden" name="id" value="${tekUserInstance?.id}" />
                    <td:profileChange ownerId="${tekUserInstance.id}" >
                    <span class="button"><link:userEdit username="${tekUserInstance.username}" >Edit Profile</link:userEdit></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>

                    </td:profileChange>
                </g:form>
                 </fieldset><br />
        </div>
    </body>
</html>

