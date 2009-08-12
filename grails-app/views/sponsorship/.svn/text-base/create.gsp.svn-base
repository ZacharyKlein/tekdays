

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Sponsorship</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Sponsorship List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Sponsorship</h1>
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
                                    <label for="event">Event:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'event','errors')}">
                                    <g:select optionKey="id" from="${TekEvent.list()}" name="event.id" value="${sponsorshipInstance?.event?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsor">Sponsor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'sponsor','errors')}">
                                    <g:select optionKey="id" from="${Sponsor.list()}" name="sponsor.id" value="${sponsorshipInstance?.sponsor?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contributionType">Contribution Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'contributionType','errors')}">
                                    <g:select id="contributionType" name="contributionType" from="${sponsorshipInstance.constraints.contributionType.inList}" value="${sponsorshipInstance.contributionType}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:sponsorshipInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorshipInstance,field:'notes','errors')}">
                                    <textarea rows="5" cols="40" name="notes">${fieldValue(bean:sponsorshipInstance, field:'notes')}</textarea>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
