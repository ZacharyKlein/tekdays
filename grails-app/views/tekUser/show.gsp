

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show TekUser</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekUser List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekUser</g:link></span>
        </div>
        <div class="body">
            <h1>Show TekUser</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Full Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'fullName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'userName')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Avatar:</td>
                            
                            <td valign="top" class="value"><img src="${request.contextPath}/images/avatars/${tekUserInstance.userName}-avatar.jpg" height ="100" width="90" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Website:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'website')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bio:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'bio')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekUserInstance, field:'password')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${tekUserInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
