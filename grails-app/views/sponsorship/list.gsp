

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="sponsor"/>
        <g:set var="entityName" value="${message(code:'sponsorship.label', default:'Sponsorship')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
		      <span>Sponsorships</span>
        </div>
        <div class="list">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>


                   	        <th><g:message code="sponsorship.sponsor.label" default="Sponsor" /></th>

                   	        <th>${message(code:'sponsorship.contributionType.label', default:'Contribution Type')}</th>

														<th>Approved</th>

                   	        <th></th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorshipInstanceList}" status="i" var="sponsorshipInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                            <td>${fieldValue(bean:sponsorshipInstance, field:'sponsor')}</td>

                            <td>${fieldValue(bean:sponsorshipInstance, field:'contributionType')}</td>

														<td>
															<g:if test="${sponsorshipInstance.sponsorApproved & sponsorshipInstance.organizerApproved}">
																Yes
															</g:if>
															<g:else>
																No
															</g:else>
														</td>
														
                            <td><g:link action="edit" id="${sponsorshipInstance.id}">View</g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorshipInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

