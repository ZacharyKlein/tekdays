

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsorship.label', default:'Sponsorship')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Show ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.id.label" default="Id" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.event.label" default="Event" />:
                            </td>
                            
                            <td valign="top" class="value"><g:link controller="tekEvent" action="show" id="${sponsorshipInstance?.event?.id}">${sponsorshipInstance?.event?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.sponsor.label" default="Sponsor" />:
                            </td>
                            
                            <td valign="top" class="value"><g:link controller="sponsor" action="show" id="${sponsorshipInstance?.sponsor?.id}">${sponsorshipInstance?.sponsor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.contributionType.label" default="Contribution Type" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'contributionType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.description.label" default="Description" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.notes.label" default="Notes" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'notes')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.sponsorApproved.label" default="Sponsor Approved" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'sponsorApproved')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="sponsorship.organizerApproved.label" default="Organizer Approved" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'organizerApproved')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${sponsorshipInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
