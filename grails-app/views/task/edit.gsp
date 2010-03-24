

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="tasks" />
        <title>TekDays &rarr; Edit Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}"><button>Home</button></a></span>
            <span class="menuButton"><g:link class="list" action="list" id="${taskInstance.event?.id}"><button>All Tasks (${allTasks.size()})</button></g:link></span>
            <span class="menuButton"><g:link class="create" action="create" id="${taskInstance.event?.id}"><button>New Task</button></g:link></span>
        </div>
        <div class="body">
            <h1>Edit Task: ${taskInstance.title}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${taskInstance?.id}" />
                <input type="hidden" name="version" value="${taskInstance?.version}" />
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
                                    <g:select optionKey="id" from="${TekUser.list()}" name="assignedTo.id" value="${taskInstance?.assignedTo?.id}" noSelection="['null':'Choose someone...']"></g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate">Due Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'dueDate','errors')}">
                                    <g:datePicker name="dueDate" precision="day" value="${taskInstance?.dueDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr>

                             <input type="hidden" name="tekEventInstance.id" value="${taskInstance?.event?.id}" />

                            <!-- START:completed -->
                            <tr class="prop">
                              <td valign="top" class="name">
                               <label for="completed">Completed:</label>
                              </td>
                              <td valign="top">
                                <g:checkBox name="completed" value="${taskInstance?.completed}"/>
                              </td>
                            </tr>
                        </tbody>
                        <!-- END:completed -->
                    </table>
                </div><br />
                <div>
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><input type="button" value="Back" onClick="history.back()" />
                </div>
            </g:form>
        </div>
    </body>
</html>

