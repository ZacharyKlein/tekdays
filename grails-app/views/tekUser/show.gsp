

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays | ${tekUserInstance.username}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">All Users</g:link></span>
            <g:isNotLoggedIn>
                <span class="menuButton"><g:link class="create" action="create">Register</g:link></span>
            </g:isNotLoggedIn>
        </div>
        <div class="body">
            <h1>${tekUserInstance.username}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Full Name:</td>
                            
                            <td valign="top" class="value"><g:displayFullName username="${tekUserInstance.username}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"></td>
                            
                            <td valign="top" class="value"><g:showAvatar username="${tekUserInstance.username}" height="100" width="90" /></td>
                            
                        </tr>
                         
                        <g:if test="${tekUserInstance.bio}">
                        <tr class="prop">
                            <td valign="top" class="name">Bio:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'bio')}</td>
                            
                        </tr>
                        </g:if>
                    
                        <g:if test="${tekUserInstance.website}">
                        <tr class="prop">
                            <td valign="top" class="name">Website:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'website')}</td>
                            
                        </tr>
                        </g:if>

                        <tr class="prop">
                            <td valign="top" class="name"></td>
                            
                            <td valign="top" class="value"><input type="hidden" name="username" value="${tekUserInstance?.username}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="username" value="${tekUserInstance?.username}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Edit Profile" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Are you sure?');" value="Delete this account" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
