

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="tasks" />
        <title>TekDays &rarr; All Tasks</title>
        <g:javascript library="prototype" />
        <gui:resources components="['datePicker']" />
       
        <g:javascript>
        function clearPost(e) {
            $('postContent').value='';
        }
        function showSpinner(visible) {
            $('spinner').style.display = visible ? "inline" : "none";
        }
        </g:javascript>

    </head>

        <div>
            <div class="nav">
							<span>Tasks</span>
				    </div>

		        <span id="help_5">
			  <td:helpBox id="5">
			    <div class="help">
			      <img src="${resource(dir:'images', file:'help.png')}" style="float:right" />
			      <h3>TODO - Get things done</h3>
		              <p>You can keep track of what needs to be done on your tasks page - tasks are assignable to users and can be edited or deleted when necessary
			        <g:remoteLink controller="tekUser" action="hideHelp" id="5" update="help_5" onLoading="showSpinner();">
			          ${message(code:'home.loggedin.associated.hide')}
			        </g:remoteLink>
			      </p>
			    </div>
			  </td:helpBox>
		        </span>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
             <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
           
            <div id="taskList" class="list">
                <table>
                    <thead>
                        <tr>

                   	        <th>Title</th>

                   	        <th>Assigned To</th>

                   	        <th>Due Date</th>

                   	        <th>Status</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><a href="${createLink(action:'show', slug:tekEventInstance.slug, id:taskInstance.id)}">${fieldValue(bean:taskInstance, field:'title')}</a></td>

                            <td>${taskInstance.assignedTo ?: "Not assigned"}</td>

                            <td>
                            <g:if test="${taskInstance.dueDate}"><g:formatDate format="MMMM dd, yyyy" date="${taskInstance.dueDate}" /></g:if>
                            <g:else>No date selected</g:else>
                            </td>
                            <td>
                              <div id="${taskInstance.id}status">
                               <g:if test="${!taskInstance.completed}">
                                <p><strong>incomplete</strong> (<g:remoteLink action="markComplete" id="${taskInstance.id}" update="${taskInstance.id}status" >change</g:remoteLink>)</p>
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

		              <g:form action="addTask">
		                  <div class="dialog" style="margin-top:10px;">
			                  <fieldset style="padding-left:30px">
			                    <legend>New Task for ${tekEventInstance?.name}</legend>
		                      <p>
		                        <label for="title" class="editdetail">Title:</label>
		                        <input type="text" id="title" name="title" class="editdetail" value="${fieldValue(bean:taskInstance,field:'title')}"/>
		                      </p>
		                      <p>
		                        <label for="username" class="editdetail">Notes:</label>
		                        <textarea rows="5" cols="40" name="notes" style="width:600px;">${fieldValue(bean:taskInstance, field:'notes')}</textarea>
		                      </p>
		                      <p>
		                        <label for="assignedTo" class="editdetail">Assigned To:</label>
		                        <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.profile?.fullName}" noSelection="['null':'Choose someone...']"></g:select>
		                      </p>
		                      <p>
		                        <label for="dueDate" class="editdetail">Due Date:</label>
		                        <gui:datePicker name="dueDate" id='dueDate' value="${taskInstance?.dueDate}" formatString="MM/dd/yyyy" includeTime="false"/>
		                      </p>
		                      <input type="hidden" id="slug" name="slug" value="${tekEventInstance?.slug}" />

		                      <div>
			                      <p>
		                        <span class="button">
			                        <input class="save" type="submit" value="Submit" />
		                        </span>
														</p>
		                      </div>
		                    </fieldset>
		                  </div>
		              </g:form>

            </div>
        </div>
    </body>
</html>

