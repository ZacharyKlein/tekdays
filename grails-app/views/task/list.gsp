

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; All Tasks</title>
        <g:javascript library="prototype" />
        <gui:resources components="['datePicker', 'accordion']" />
       
        <g:javascript>
        function clearPost(e) {
            $('postContent').value='';
        }
        function showSpinner(visible) {
            $('spinner').style.display = visible ? "inline" : "none";
        }
        </g:javascript>

    </head>

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
            <div id="taskList" class="list">
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
                                       update="taskList"
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
        </div>
    </body>
</html>

