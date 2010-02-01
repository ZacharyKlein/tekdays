            <h1>All Files</h1>
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
                    </tbody>
                </table>
            </div>

