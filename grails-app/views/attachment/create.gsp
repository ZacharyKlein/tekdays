

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; New Attachment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">All attachments</g:link></span>
        </div>
        <div class="body">
            <h1>New attachment</h1>
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
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="displayName">Display name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attachmentInstance, field: 'displayName', 'errors')}">
                                    <g:textField name="displayName" value="${attachmentInstance?.displayName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="file"><g:message code="attachment.file.label" default="File" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attachmentInstance, field: 'file', 'errors')}">
                                    <input type="file" id="file" name="file" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <input type="hidden" id="eventId" name="eventId" value="${eventId}" />
                </div>
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
            </g:form>
        </div>
    </body>
</html>

