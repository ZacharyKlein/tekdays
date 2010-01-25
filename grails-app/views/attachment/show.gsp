

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="event" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; View File</title>
    </head>
    <body>
<div class="nav">
            <span class="menuButton"><link:eventHome slug="${tekEventInstance?.slug}">Event Home</link:eventHome></span>
            <span class="menuButton"><link:eventAttachments       slug="${attachmentInstance?.event?.slug}">All Files</link:eventAttachments></span>
            <span class="menuButton"><link:newAttachment slug="${attachmentInstance?.event.slug}">Upload A File</link:newAttachment></span>
        </div>
        <div class="body">
            <h1>${attachmentInstance?.event.name} - Files</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            <fieldset>
              <legend>View File</legend>
              <p>
                <label for="name" class="editdetail"><strong>Name:</strong></label>
                ${attachmentInstance?.displayName ?: attachmentInstance.name}
              </p>
              <p>
                <label for="description" class="editdetail"><strong>Description:</strong></label>
                ${attachmentInstance?.description}
              </p>
              <p>
                <label for="dateCreated" class="editdetail"><strong>Originally uploaded:</strong></label>
                <g:formatDate format="MMMM dd, yyyy" date="${attachmentInstance?.dateCreated}" /> @ <g:formatDate format="HH:mm a" date="${attachmentInstance?.dateCreated}" />
              </p>
              <p>
              <a href="${resource(dir:'files/' + attachmentInstance?.event?.name.toLowerCase().encodeAsHyphen(),file:attachmentInstance.name)}">Download</a>
              </p>
            </fieldset>
            </div>
            <div>
                <g:form>
                    <g:hiddenField name="id" value="${attachmentInstance?.id}" />
                    <g:hiddenField name="eventId" value="${attachmentInstance?.event?.id}" />
                        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

