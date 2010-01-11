

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; Edit File</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><link:eventAttachments name="${event?.name.toLowerCase().encodeAsHyphen()}">All Files</link:eventAttachments></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${attachmentInstance?.event?.name} - Files</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${attachmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${attachmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${attachmentInstance?.id}" />
                <g:hiddenField name="version" value="${attachmentInstance?.version}" />
                <div class="dialog">
                <fieldset>
                  <legend>Edit File</legend>
                  <p>
                    <label for="displayName" class="editdetail">Display name:</label>
                    <g:textField name="displayName" value="${attachmentInstance?.displayName}" />
                  </p>
                  <p>
                    <label for="file" class="editdetail">File:</label>
                    <input type="file" id="file" name="file" />
                  </p>
                  <p>
                    <label for="description" class="editdetail">Description: (optional)</label>
                    <textarea name="description" id="description">${attachmentInstance?.description}</textarea>
                  </p>
                  <p>
                    <input type="hidden" id="eventId" name="eventId" value="${event?.id}" />
                  </p>
                </fieldset>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

