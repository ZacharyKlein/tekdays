

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; ${event.name} Files</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><link:eventHome slug="${event?.slug}">Event Home</link:eventHome></span>
            <span class="menuButton"><link:newAttachment slug="${event?.slug}">Upload A File</link:newAttachment></span>
        </div>
        <div class="body">
            <h1>All Files</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'attachment.id.label', default: 'Id')}" />

                            <g:sortableColumn property="name" title="Display Name" />

                            <g:sortableColumn property="location" title="File" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${attachmentInstance.id}">${fieldValue(bean: attachmentInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: attachmentInstance, field: "displayName")}</td>

                            <td><a href="${resource(dir:'files/' + attachmentInstance?.event?.slug,file:attachmentInstance.name)}">${attachmentInstance.name}</a></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${attachmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

