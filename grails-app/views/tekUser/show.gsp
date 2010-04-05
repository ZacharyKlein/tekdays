

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

                    <div style="float:left">

	                    <img class="avatar" src="${createLink(controller:'tekUser', action:'displayAvatar', params:[username:tekUserInstance.username])}" />

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
	                        <p>Joined: <g:formatDate date="${tekUserInstance?.dateCreated}" format="MM/dd/yyyy" /></p>
	                    </div>
										</div>
                    
                    <g:if test="${organizerEvents}">
                    <div style="border:0; float:right; padding:10px" id="associatedEvents">
                      <strong>Events ${tekUserInstance.username} is associated with:</strong>
											<g:render template="/home/aEvents" model="[organizerEvents:organizerEvents, volunteerEvents:volunteerEvents, sponsoredEvents:sponsoredEvents]" />
                    </div>
                    </g:if>

		            <br />
                     <g:form>
                    <input type="hidden" name="username" value="${tekUserInstance?.username}" />
                    <input type="hidden" name="id" value="${tekUserInstance?.id}" />
                    <td:profileChange ownerId="${tekUserInstance.id}" >
                    <br/>
                    <div class="clear">
	                    <span class="button"><link:userEdit username="${tekUserInstance.username}" >Edit Profile</link:userEdit></span>
	                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
									  </div>
                    </td:profileChange>
                </g:form>
                 </fieldset><br />
        </div>
    </body>
</html>

