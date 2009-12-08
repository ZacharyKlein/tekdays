

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'attachment.id.label', default: 'Id')}" />

                            <g:sortableColumn property="name" title="${message(code: 'attachment.name.label', default: 'Name')}" />

                            <g:sortableColumn property="location" title="${message(code: 'attachment.location.label', default: 'Location')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${attachmentInstance.id}">${fieldValue(bean: attachmentInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: attachmentInstance, field: "name")}</td>

                            <td>${fieldValue(bean: attachmentInstance, field: "location")}</td>

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

