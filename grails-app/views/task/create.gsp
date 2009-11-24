

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}"><button>Home</button></a></span>
            <g:if test="${params?.name}">
                <span class="menuButton"><link:dashboard name="${params?.name?.toLowerCase().encodeAsHyphen()}"><button>Event Dashboard</button></link:dashboard></span>
            </g:if>
            <span class="menuButton"><link:allTasks name="${params.name.toLowerCase().encodeAsHyphen()}"><button>All Tasks (${allTasks.size()})</button></link:allTasks></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                       <g:select optionKey="id" from="${associatedUsers}" name="assignedTo.id" value="${taskInstance?.assignedTo?.fullname}" noSelection="['null':'Choose someone...']"></g:select>
                     </p><br />
                     <p>
                       <label for="dueDate">Due Date:</label>
                       <g:datePicker name="dueDate" value="${taskInstance?.dueDate}" noSelection="['':'']"></g:datePicker>
                     </p>

                     <input type="hidden" id="eventId" name="eventId" value="${event?.id}" /><br />

                     <div>
                       <span class="button"><g:actionSubmit class="save" type="submit" action="save" value="Save" /></span>
                       <span class="button"><input type="button" value="Back" onClick="history.back()" />
                     </div>
                 </fieldset>
                </div>
            </g:form>
        </div>
    </body>
</html>

