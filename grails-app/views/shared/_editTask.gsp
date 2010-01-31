<span class="botton">
    <g:remoteLink controller="task" action="list" update="taskList" params="[slug:params.slug]">Back</g:remoteLink>
</span>
<g:hasErrors bean="${taskInstance}">
    <div class="errors">
        <g:renderErrors bean="${taskInstance}" as="list" />
    </div>
</g:hasErrors>
<g:formRemote
    name="updateTaskForm"
    url="[controller:'task', action:'updateTask']"
    update="taskList"
    onSuccess="clearTask(e)"
    onLoading="showSpinner(true)"
    onComplete="showSpinner(false)">

    <input type="hidden" name="id" value="${taskInstance?.id}" />
    <input type="hidden" name="version" value="${taskInstance?.version}" />

    <div class="dialog">
        <fieldset>
            <legend>Edit Task: ${taskInstance.title}</legend>
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

            <span class='button'>
                <input type="submit" onClick="this.blur()" value="Update Task"/>
                <img id="spinner" style="display: none" src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>
            </span>

     </fieldset>
    </div>
</g:formRemote>
