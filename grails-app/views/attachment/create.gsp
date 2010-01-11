

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; Upload a File</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><link:eventAttachments name="${event?.name.toLowerCase().encodeAsHyphen()}">All Files</link:eventAttachments></span>
        </div>
        <div class="body">
            <h1>${event.name} - Files</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${attachmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${attachmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                <fieldset>
                  <legend>Upload a File</legend>
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
                    <textarea rows="5" cols="40" name="description" id="description">${attachmentInstance?.description}</textarea>
                  </p>
                  <p>
                    <input type="hidden" id="eventId" name="eventId" value="${event.id}" />
                  </p>
                </fieldset>
                </div>
                    <span class="button"><g:submitButton name="create" class="save" value="Upload" /></span>
            </g:form>
        </div>
    </body>
</html>

