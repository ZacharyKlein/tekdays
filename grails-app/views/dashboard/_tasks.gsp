<h3>Things to do</h3>
<table>
  <thead>
    <tr>
      <th>Task Title</th>
      <th>Due Date</th>
      <th>Assigned To</th>
    </tr>
    </thead>
    <g:each in="${tasks}" var="task">
      <tr>
        <td><g:link controller="task" action="show" id="${task?.id}">${task?.title}</g:link></td>
        <td><g:formatDate format="MM/dd/yyyy" date="${task?.dueDate}" /></td>
        <td>
          <g:if test="${task?.assignedTo}">
            <link:profile username="${task?.assignedTo.username}">${task?.assignedTo}</link:profile>
          </g:if>
          <g:else>
            <strong>Not assigned yet</strong>
          </g:else>
        </td>
      </tr>
  </g:each>
</table>
<link:allTasks name="${event?.name?.toLowerCase().encodeAsHyphen()}">
  View all ${event?.tasks?.size()} tasks for this event.
</link:allTasks>

