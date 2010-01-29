

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsorship.label', default:'Sponsorship')}" />
        <title>TekDays &rarr; ${event?.name} Sponsor: ${sponsorshipInstance?.sponsor.name}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><link:eventHome slug="${event?.slug}">Event Home</link:eventHome></span>
            <span class="menuButton"><link:sponsorshipList slug="${event?.name}">All Sponsors</link:sponsorshipList></span>
        </div>
        <div class="body">
            <h1>${event?.name} Sponsor: ${sponsorshipInstance.sponsor.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${isOrganizer}">
            <fieldset>
                <legend>${sponsorshipInstance?.sponsor.name}</legend>

                <td:showLogo id="${sponsorshipInstance?.sponsor.id}" height="80" width="80" />

                <p>Representative: <strong>${sponsorshipInstance?.sponsor.rep.profile?.fullName ?: sponsorshipInstance.sponsor.rep.username}</strong></p>

                <p>
                    ${sponsorshipInstance?.sponsor.description}
                </p>
            </fieldset>
            </g:if>
            <g:else>
             <fieldset>
                <legend>${sponsorshipInstance?.event.name}</legend>

                <p>
                    ${sponsorshipInstance?.event.description}
                </p>

                <p>To be held in <strong>${sponsorshipInstance.event.city}</strong></p>
                </p>

                <g:if test="${sponsorshipInstance.event.startDate}">
                <p>
                    <g:formatDate format="MMMM dd, yyyy" date="${sponsorshipInstance.event.startDate}"/>
                </g:if>
                <g:if test="${sponsorshipInstance.event.endDate}">
                 - <g:formatDate format="MMMM dd, yyyy" date="${sponsorshipInstance.event.endDate}"/>
                </p>
                </g:if>
                <g:else>
                </p>
                </g:else>

                <p>Organized by <strong>${sponsorshipInstance?.event.organizer.profile?.fullName ?: sponsorshipInstance.event.organizer.username}</strong>
                </p>
            </fieldset>
            </g:else>
            <g:hasErrors bean="${sponsorshipInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorshipInstance}" as="list" />
            </div>
            </g:hasErrors>
            <fieldset>
            <g:form method="post" >
                <input type="hidden" name="id" value="${sponsorshipInstance?.id}" />
                <input type="hidden" name="version" value="${sponsorshipInstance?.version}" />
                <div class="dialog">
                    <g:if test="${isOrganizer}">
                        <p>
                            <label for="organizerApproved">Approved:</label>
                            <g:checkBox name="organizerApproved" value="${sponsorshipInstance?.organizerApproved}" ></g:checkBox>
                        </p><br />
                    </g:if>
                    <g:else>
                       <p>
                            <label for="sponsorApproved">Approved:</label>
                            <g:checkBox name="sponsorApproved" value="${sponsorshipInstance?.sponsorApproved}" ></g:checkBox>
                       </p><br />
                    </g:else>
                </div>
                <div>
                    <g:if test="${isOrganizer}">
                        <span class="button"><g:actionSubmit action="organizerAccept" value="Update" /></span>
                    </g:if>
                    <g:else>
                        <span class="button"><g:actionSubmit action="sponsorAccept" value="Update" /></span>
                    </g:else>
                </div>
            </g:form>
            </fieldset>
        </div>
    </body>
</html>

