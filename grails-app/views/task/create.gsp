

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Task</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Back to Dashboard</g:link></span>
        </div>
        <div class="body">
            <h1>New Task for ${taskInstance.event?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:taskInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'notes','errors')}">
                                    <textarea rows="5" cols="40" name="notes">${fieldValue(bean:taskInstance, field:'notes')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assignedTo">Assigned To:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'assignedTo','errors')}">
                                    <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.fullname}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate">Due Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'dueDate','errors')}">
                                    <g:datePicker name="dueDate" value="${taskInstance?.dueDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                                    <input type="hidden" id="eventId" name="eventId" value="${taskInstance.event.id}" />
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Save" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
