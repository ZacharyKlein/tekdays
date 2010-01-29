
<table>
    <thead>
        <tr>

            <g:sortableColumn property="title" title="Title" />

            <th>Assigned To</th>

            <g:sortableColumn property="dueDate" title="Due Date" />

            <g:sortableColumn property="completed" title="Status" />

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
              <div id="${taskInstance.id}status">
               <g:if test="${!taskInstance.completed}">
                <p><strong>incomplete</strong><br /> (<g:remoteLink action="markComplete" id="${taskInstance.id}" update="${taskInstance.id}status" >mark completed</g:remoteLink>)</p>
               </g:if>
               <g:else>
               <p>completed</p>
               </g:else>
              </div>
            </td>

        </tr>
    </g:each>

    </tbody>
</table>