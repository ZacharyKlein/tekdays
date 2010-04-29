

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="files" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; View File</title>
    </head>
    <body>
        <div class="nav">
            <span><g:link action="list" params="[slug:tekEventInstance.slug]">Files</g:link></span> &nbsp; > &nbsp; ${attachmentInstance?.displayName ?: attachmentInstance.name}
        </div>
        <div>
          <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
          </g:if>
          <div class="dialog">
            <fieldset>
              <legend>${attachmentInstance?.displayName ?: attachmentInstance.name}</legend>
              <p>
                <label for="description" class="editdetail"><strong>Description:</strong></label>
                ${attachmentInstance?.description}
              </p>
              <p>
                <label for="dateCreated" class="editdetail"><strong>Originally uploaded:</strong></label>
                <g:formatDate format="MMMM dd, yyyy" date="${attachmentInstance?.dateCreated}" /> @ <g:formatDate format="HH:mm a" date="${attachmentInstance?.dateCreated}" />
              </p>
              <p>
              <span class="button">
	              <a href="${resource(dir:attachmentInstance.location,file:attachmentInstance.name)}">
		              Download
	              </a>
              </span>

              <g:form>
	              <g:hiddenField name="id" value="${attachmentInstance?.id}" />
								<span class="button">
									<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
              </g:form>
               </p>
            </fieldset>
          </div>
            <div>
            </div>
        </div>
    </body>
</html>

