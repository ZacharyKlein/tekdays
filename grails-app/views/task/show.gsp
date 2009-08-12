

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Task List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>Show Task</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Notes:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'notes')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Assigned To:</td>
                            
                            <td valign="top" class="value"><g:link controller="tekUser" action="show" id="${taskInstance?.assignedTo?.id}">${taskInstance?.assignedTo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Due Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'dueDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Event:</td>
                            
                            <td valign="top" class="value"><g:link controller="tekEvent" action="show" id="${taskInstance?.event?.id}">${taskInstance?.event?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                      <!-- START:completed -->
                        <tr class="prop">
                          <td valign="top" class="name">Completed:</td>
                          <td valign="top" class="value">
                            ${fieldValue(bean:taskInstance, field:'completed')}
                          </td>
                        </tr>
                    </tbody>
                    <!-- END:completed -->                  
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${taskInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
