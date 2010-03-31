

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Edit "${tekPostInstance?.title}"</title>
    </head>
    <body>
        <div class="body"><br />
            <h1>The TekDays Blog</h1><br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekPostInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekPostInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tekPostInstance?.id}" />
                <g:hiddenField name="version" value="${tekPostInstance?.version}" />
              <fieldset>
                <legend>Edit Post</legend>
                <p>
                  <label for="title" class="editdetail">Title:</label>
                  <input type="text" name="title" id="title" class="editdetail" style="width:625px;" value="${tekPostInstance?.title}" /> <%-- UGLINESS BEGINS TO OCCUR; YOU BETTER FIX THIS --%>
                </p>
    
                <p>
                  <g:textArea name="body" cols="100" rows="9" value="${tekPostInstance?.body}" />
                </p>
               </fieldset>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
