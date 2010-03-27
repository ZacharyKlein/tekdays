

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="files" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; ${tekEventInstance.name} Files</title>
    </head>
    <body>
        <div class="nav">
            <span>Files</span>
        </div>
        <div class="list">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="name" title="Display Name" />

                            <g:sortableColumn property="location" title="File" />

                            <g:sortableColumn property="id" title=" " />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean: attachmentInstance, field: "displayName")}</td>

                            <td><a href="${resource(dir:'files/' + attachmentInstance?.event?.slug,file:attachmentInstance.name)}">${attachmentInstance.name}</a></td>

                            <td><g:link action="show" id="${attachmentInstance.id}">Details</g:link></td>

                        </tr>
                    </g:each>
                    <g:if test="${attachmentInstanceList.size() == 0}">
                        <tr>
                            <td id="noTopics" colspan="2"><h2>Uploaded Files</h2> <p>Files you upload here will be available for all your volunteers.</p></td>
													  
                        </tr>
                    </g:if>
                  </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${attachmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

