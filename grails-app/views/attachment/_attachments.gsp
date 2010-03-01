            <h1>${tekEventInstance.name} - Uploaded Files</h1>
            <br/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div id="attachmentList" style="background:white; padding:5px; border:1px solid #CCCCCC">
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

                            <td><a href="${resource(dir:'files/' + attachmentInstance?.tekEventInstance?.slug,file:attachmentInstance.name)}">${attachmentInstance.name}</a></td>

                            <td><g:remoteLink controller="attachment" action="editFile" update="attachmentList" params="[id:attachmentInstance.id, slug:params.slug]">Details</g:remoteLink></td>

                        </tr>
                    </g:each>
                     <g:if test="${attachmentInstanceList.size() == 0}">
                        <tr>
                            <td id="noTopics" colspan="4"><h2>Uploaded Files</h2> <p>Files you upload here will be available for all your volunteers.</p></td>
                        </tr>
                    </g:if>
                    </tbody>
                </table>
            </div>

