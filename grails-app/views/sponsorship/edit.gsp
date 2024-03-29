

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="sponsor"/>
        <g:set var="entityName" value="${message(code:'sponsorship.label', default:'Sponsorship')}" />
        <title>TekDays &rarr; ${tekEventInstance?.name} Sponsor: ${sponsorshipInstance?.sponsor.name}</title>
    </head>
    <body>
        <div class="nav">
		      <span><g:link action="list" params="[slug:tekEventInstance.slug]">Sponsorships</g:link></span> &nbsp; > &nbsp; ${sponsorshipInstance.sponsor.name}
        </div>
        <div>
           
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${isOrganizer}">
            <fieldset>
                <legend>${sponsorshipInstance?.sponsor.name}</legend>

                <%--<td:showLogo id="${sponsorshipInstance?.sponsor.id}" height="80" width="80" />--%>

                <p>Representative: <strong>${sponsorshipInstance?.sponsor.rep.profile?.fullName ?: sponsorshipInstance.sponsor.rep.username}</strong></p>

                <p>
                    ${sponsorshipInstance?.sponsor.description}
                </p>
                <p>
                    ${sponsorshipInstance?.sponsorMessage}
                </p>

            </g:if>
            <g:else>

                <legend>${sponsorshipInstance?.event.name}</legend>

                <p>
                    ${sponsorshipInstance?.event.description}
                </p>

                <p>To be held in <strong>${sponsorshipInstance.event.city}</strong></p>
                </p>

                <%--<g:if test="${sponsorshipInstance.event.startDate}">
                <p>
                    <g:formatDate format="MMMM dd, yyyy" date="${sponsorshipInstance.event.startDate}"/>
                </g:if>
                <g:if test="${sponsorshipInstance.event.endDate}">
                 - <g:formatDate format="MMMM dd, yyyy" date="${sponsorshipInstance.event.endDate}"/>
                </p>
                </g:if>
                <g:else>
                </p>
                </g:else>--%>

                <p>Organized by <strong>${sponsorshipInstance?.event.organizer.profile?.fullName ?: sponsorshipInstance.event.organizer.username}</strong>
                </p>

                <p>
                     ${sponsorshipInstance?.organizerMessage}
                </p>

            </g:else>
            <g:hasErrors bean="${sponsorshipInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorshipInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form method="post" >
                <input type="hidden" name="id" value="${sponsorshipInstance?.id}" />
                <input type="hidden" name="version" value="${sponsorshipInstance?.version}" />
                <div class="dialog">
                </div>
                <g:if test="${!sponsorshipInstance.sponsorApproved || !sponsorshipInstance.organizerApproved}">
	                <div>
	                    <g:if test="${isOrganizer}">
	                        <span class="button"><g:actionSubmit action="organizerAccept" value="Accept" /></span>
	                    </g:if>
	                    <g:else>
	                        <span class="button"><g:actionSubmit action="sponsorAccept" value="Approve" /></span>
	                    </g:else>
	                </div>
                </g:if>
                <g:else>

	                <br/>
									<strong>Approved</strong>
                </g:else>
            </g:form>
            </fieldset>
        </div>
    </body>
</html>

