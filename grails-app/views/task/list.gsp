

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; All Tasks</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create" id="${params.id}">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>All Tasks (${taskInstanceList.size()})</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <th>Assigned To</th>
                   	    
                   	        <g:sortableColumn property="dueDate" title="Due Date" />

                   	        <g:sortableColumn property="completed" title="Completed" />
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="${createLink(action:'show', eventId:taskInstance.event.id, id:taskInstance.id)}">${fieldValue(bean:taskInstance, field:'title')}</a></td>
                        
                            <td>${taskInstance.assignedTo ?: "Not assigned"}</td>
                        
                            <td>
                            <g:if test="${taskInstance.dueDate}"><g:formatDate format="MMMM dd, yyyy" date="${taskInstance.dueDate}" /></g:if>
                            <g:else>No date selected</g:else>
                            </td>
                            <td>
                            <g:checkBox name="completed" value="${taskInstance?.completed}" onclick="${remoteFunction(action:'updateStatus', id:taskInstance.id,  params:'[status:' + this.checked + ']')}" />
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
