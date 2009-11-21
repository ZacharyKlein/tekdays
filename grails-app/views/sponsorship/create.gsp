

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsorship.label', default:'Sponsorship')}" />
        <title>TekDays &rarr; New Sponsor for ${event?.name}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <g:if test="${params?.name}">
                <span class="menuButton"><link:dashboard name="${params?.name?.toLowerCase().encodeAsHyphen()}">Back to Event Dashboard</link:dashboard></span>
            </g:if>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
        </div>
        <div class="body">
            <h1>New Sponsor for ${event?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorshipInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorshipInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="event">
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'event','errors')}">
                                    <input type="hidden" name="event.id" value="${sponsorshipInstance?.event?.id}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsor">
                                      <g:message code="sponsorship.sponsor.label" default="Sponsor" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'sponsor','errors')}">
                                    <g:select optionKey="id" from="${Sponsor.list()}" name="sponsor.id" value="${sponsorshipInstance?.sponsor?.id}" ></g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contributionType">
                                      <g:message code="sponsorship.contributionType.label" default="Contribution Type" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'contributionType','errors')}">
                                    <g:select id="contributionType" name="contributionType" from="${sponsorshipInstance.constraints.contributionType.inList}" value="${sponsorshipInstance.contributionType}" ></g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">
                                      <g:message code="sponsorship.description.label" default="Description" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:sponsorshipInstance,field:'description')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">
                                      <g:message code="sponsorship.notes.label" default="Notes" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'notes','errors')}">
                                    <textarea rows="5" cols="40" name="notes">${fieldValue(bean:sponsorshipInstance, field:'notes')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsorApproved">
                                      <g:message code="sponsorship.sponsorApproved.label" default="Sponsor Approved" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'sponsorApproved','errors')}">
                                    <g:checkBox name="sponsorApproved" value="${sponsorshipInstance?.sponsorApproved}" ></g:checkBox>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizerApproved">
                                      <g:message code="sponsorship.organizerApproved.label" default="Organizer Approved" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'organizerApproved','errors')}">
                                    <g:checkBox name="organizerApproved" value="${sponsorshipInstance?.organizerApproved}" ></g:checkBox>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                    <span class="button"><input class="save" type="submit" value="Create" /></span><br />

            </g:form>
        </div>
    </body>
</html>

