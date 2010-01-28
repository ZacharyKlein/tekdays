<div class="body">
    <h1>All Tasks (${taskInstanceTotal})</h1>
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
     <g:hasErrors bean="${taskInstance}">
    <div class="errors">
        <g:renderErrors bean="${taskInstance}" as="list" />
    </div>
    </g:hasErrors>
    <br />
    <div id="allTasks" class="list">
        <g:render template="allTasks" model="[taskInstanceList:taskInstanceList]"/>
    </div>
    
    <gui:accordion>
        <gui:accordionElement title="Add Task">
            <g:form action="addTask">
                <div class="dialog">
                <fieldset>
                   <legend>New Task for ${event?.name}</legend>
                     <p>
                       <label for="title" class="editdetail">Title:</label>
                       <input type="text" id="title" name="title" class="editdetail" value="${fieldValue(bean:taskInstance,field:'title')}"/>
                     </p>
                     <p>
                       <label for="username" class="editdetail">Notes:</label>
                       <textarea rows="5" cols="40" name="notes" style="width:600px;">${fieldValue(bean:taskInstance, field:'notes')}</textarea>
                     </p><br />
                     <p>
                       <label for="assignedTo" class="editdetail">Assigned To:</label>
                       <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.profile?.fullName}" noSelection="['null':'Choose someone...']"></g:select>
                     </p><br />
                     <p>
                       <label for="dueDate">Due Date:</label>
                       <gui:datePicker name="dueDate" id='dueDate' value="${taskInstance?.dueDate}" formatString="MM/dd/yyyy" includeTime="false"/>
                     </p>
                     <input type="hidden" id="slug" name="slug" value="${event?.slug}" /><br />

                     <div>
                       <span class="button"><g:submitToRemote value="Add"
                           url="[controller:'task', action:'addTask']"
                           update="allTasks"
                           onSuccess="clearTask(e)"
                           onLoading="showSpinner(true)"
                           onComplete="showSpinner(false)"/>
                        </span>
                    
                     </div>
                 </fieldset>
                </div>
            </g:form>
        </gui:accordionElement>
    </gui:accordion>

</div>
