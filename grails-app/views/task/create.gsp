

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <g:if test="${params?.name}">
                <span class="menuButton"><link:dashboard name="${params?.name}">Back to Event Dashboard</link:dashboard></span>
            </g:if>
            <span class="menuButton"><g:link controller="task" action="list" id="${params.id}">All Tasks</g:link> (${allTasks.size()})</span>
        </div>
        <div class="body">
            <h1>New Task for ${event?.name}</h1>
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
                                    <input type="text" id="title" name="title" style="width:600px;" value="${fieldValue(bean:taskInstance,field:'title')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes">Notes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'notes','errors')}">
                                    <textarea rows="5" cols="40" name="notes" style="width:600px;">${fieldValue(bean:taskInstance, field:'notes')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assignedTo">Assigned To:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'assignedTo','errors')}">
                                    <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.fullname}" noSelection="['null':'Choose someone...']"></g:select>
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
                                    <input type="hidden" id="eventId" name="eventId" value="${event?.id}" />

                        </tbody>
                    </table>
                </div><br />
                <div>
                    <span class="button"><g:actionSubmit class="save" type="submit" action="save" value="Save" /></span>
                    <span class="button"><input type="button" value="Back" onClick="history.back()" />
                </div>
            </g:form>
        </div>
    </body>
</html>

