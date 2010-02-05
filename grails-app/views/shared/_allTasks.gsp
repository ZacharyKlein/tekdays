<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<table>
   <thead>
        <tr>

            <g:sortableColumn property="title" title="Title" />

            <th>Assigned To</th>

            <g:sortableColumn property="dueDate" title="Due Date" />

            <g:sortableColumn property="completed" title="Status" />

        </tr>
    </thead>
    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td><g:remoteLink controller="task" action="editTask" update="taskList" params="[id:taskInstance.id, slug:params.slug]">
            ${fieldValue(bean:taskInstance, field:'title')}</g:remoteLink></td>

            <td>${taskInstance.assignedTo ?: "Not assigned"}</td>

            <td>
            <g:if test="${taskInstance.dueDate}"><g:formatDate format="MMMM dd, yyyy" date="${taskInstance.dueDate}" /></g:if>
            <g:else>No date selected</g:else>
            </td>
            <td>
                <div id="${taskInstance.id}status">
                    <g:if test="${!taskInstance.completed}">
                        <p><strong>incomplete</strong>
                            (<g:remoteLink action="markComplete" id="${taskInstance.id}" update="${taskInstance.id}status" >mark completed</g:remoteLink>)
                        </p>
                    </g:if>
                    <g:else>
                        <p>completed</p>
                    </g:else>
                </div>
            </td>

        </tr>
    </g:each>

</table>

