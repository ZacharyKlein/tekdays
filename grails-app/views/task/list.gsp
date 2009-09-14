

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Task List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>Task List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="notes" title="Notes" />
                        
                   	        <th>Assigned To</th>
                   	    
                   	        <g:sortableColumn property="dueDate" title="Due Date" />
                        
                   	        <th>Event</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean:taskInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'title')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'notes')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'assignedTo')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'dueDate')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'event')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
