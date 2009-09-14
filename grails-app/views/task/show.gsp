

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; View Task for ${taskInstance.event?.name}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link controller="task" action="list" id="${taskInstance?.event?.id}">All Tasks</g:link></span>
        </div>
        <div class="body">
            <h1>${taskInstance.title}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <p>Id: ${taskInstance.id}</p>
                <p>${taskInstance.notes}</p>
                <p>Assigned to <strong><g:link controller="tekUser" action="show" id="${taskInstance?.assignedTo?.id}">${taskInstance?.assignedTo?.username.encodeAsHTML()}</g:link></strong></p>
                <p>Complete by <strong><g:formatDate format="MMMM dd, yyyy" date="${taskInstance.dueDate}" /></strong></p>
                <g:if test="${taskInstance.completed}">
                <p>This task has been completed.</p>
                </g:if>
                <g:else>
                <p><strong>This task has not been completed.</strong></p>
                </g:else>
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
