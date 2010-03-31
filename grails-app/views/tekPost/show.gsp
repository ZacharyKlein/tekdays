

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>TekDays &rarr; ${tekPostInstance?.title}</title>
    </head>
    <body>
        <div class="body"><br/>
            <h1>The TekDays Blog</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="grayBox">
              <h2 style="margin-bottom:0; padding-bottom:0;">${tekPostInstance?.title}</h2>
              <p class="desc">posted <g:formatDate format="EEEE, MMMM dd, yyyy" date="${tekPostInstance?.dateCreated}" /></p><br />
              ${tekPostInstance?.body}
            </div>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${tekPostInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
