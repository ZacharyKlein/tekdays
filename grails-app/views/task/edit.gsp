

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="tasks" />
        <title>TekDays &rarr; Edit Task</title>
    </head>
    <body class="yui-skin-sam">
	    <div class="nav">
				<span><link:allTasks slug="${taskInstance.event?.slug}">Tasks</link:allTasks></span> &nbsp; > &nbsp;
				<g:link controller="task" action="show" id="${taskInstance.id}">${taskInstance.title}</g:link> &nbsp; > &nbsp; Edit
	    </div>

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
					    <fieldset>
				        <legend>Edit Task</legend>
				        <p>
				           <label for="title" class="editdetail">Title:</label>
				           <input type="text" id="title" name="title" class="editdetail" value="${taskInstance.title}"/>
				        </p>
				        <p>
				           <label for="notes" class="editdetail">Notes:</label>
				           <textarea rows="5" cols="40" id="notes" name="notes" style="width:600px;">${taskInstance.notes}</textarea>
				        </p><br />
				        <p>
				           <label for="assignedTo" class="editdetail">Assigned To:</label>
				           <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.profile?.fullName}" noSelection="['null':'Choose someone...']"></g:select>
				        </p><br />
				        <p>
				           <label for="dueDate">Due Date:</label>
				           <gui:datePicker name="dueDate" id='dueDate' value="${taskInstance?.dueDate}" formatString="MM/dd/yyyy" includeTime="false"/>
				        </p>
				        <input type="hidden" id="slug" name="slug" value="${params.slug}" /><br />

                <div>
	                <span class="button"><g:actionSubmit class="save" value="Update" /></span>
	                <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
					    </div>

            </g:form>
          </fieldset>
    </body>
</html>

