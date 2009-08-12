

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Sponsorship</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Sponsorship List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Sponsorship</g:link></span>
        </div>
        <div class="body">
            <h1>Show Sponsorship</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Event:</td>
                            
                            <td valign="top" class="value"><g:link controller="tekEvent" action="show" id="${sponsorshipInstance?.event?.id}">${sponsorshipInstance?.event?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sponsor:</td>
                            
                            <td valign="top" class="value"><g:link controller="sponsor" action="show" id="${sponsorshipInstance?.sponsor?.id}">${sponsorshipInstance?.sponsor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Contribution Type:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'contributionType')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Notes:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:sponsorshipInstance, field:'notes')}</td>
                            
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
