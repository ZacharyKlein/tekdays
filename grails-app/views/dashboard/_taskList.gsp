<h1>${tekEventInstance.name} - Tasks (${taskInstanceTotal})</h1>



 <g:hasErrors bean="${taskInstance}">
<div class="errors">
    <g:renderErrors bean="${taskInstance}" as="list" />
</div>
</g:hasErrors>
<br />
<div id="taskList" class="list">
    <g:render template="/task/allTasks" model="[taskInstanceList:taskInstanceList]"/>
</div>
<gui:accordion>
    <gui:accordionElement title="Add Task">
        <g:formRemote
            name="addTaskForm"
            url="[controller:'task', action:'addTask']"
            update="taskList"
            onSuccess="clearTask(e)"
            onLoading="showSpinner()"
            onComplete="hideSpinner()">
            
            <div class="dialog">
                <fieldset>
                    <legend>New Task for ${tekEventInstance?.name}</legend>
                    <p>
                       <label for="title" class="editdetail">Title:</label>
                       <input type="text" id="title" name="title" class="editdetail" value="${fieldValue(bean:taskInstance,field:'title')}"/>
                    </p>
                    <p>
                       <label for="notes" class="editdetail">Notes:</label>
                       <textarea rows="5" cols="40" id="notes" name="notes" style="width:600px;">${fieldValue(bean:taskInstance, field:'notes')}</textarea>
                    </p><br />
                    <p>
                       <label for="assignedTo" class="editdetail">Assigned To:</label>
                       <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.profile?.fullName}" noSelection="['null':'Choose someone...']"></g:select>
                    </p><br />
                    <p>
                       <label for="dueDate">Due Date:</label>
                       <gui:datePicker name="dueDate" id='dueDate' value="${taskInstance?.dueDate}" formatString="MM/dd/yyyy" includeTime="false"/>
                    </p>
                    <input type="hidden" id="slug" name="slug" value="${tekEventInstance?.slug}" /><br />

                    <span class='button'>
                        <input type="submit" onClick="this.blur()" value="Add Task"/>
                        <img id="spinner" style="display: none" src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>
                    </span>
                
             </fieldset>
            </div>
        </g:formRemote>
    </gui:accordionElement>
</gui:accordion>