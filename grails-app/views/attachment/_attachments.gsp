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
                <gui:accordion>
							    <gui:accordionElement title="Upload a File">
							        <g:form
							            name="uploadFileForm"
							            url="[controller:'attachment', action:'addAttachment']"
							            onSuccess="clearTask(e)"
							            onLoading="showSpinner()"
							            onComplete="hideSpinner()">

							            <div class="dialog">
					                  <p>
					                    <label for="displayName" class="editdetail">Display name:</label>
					                    <g:textField name="displayName"/>
					                  </p>
					                  <p>
					                    <label for="file" class="editdetail">File:</label>
					                    <input type="file" id="file" name="file" />
					                  </p>
					                  <p>
					                    <label for="description" class="editdetail">Description: (optional)</label>
					                    <textarea rows="5" cols="40" name="description" id="description" value="">&nbsp;</textarea>
					                  </p>
				                    <input type="hidden" id="slug" name="slug" value="${tekEventInstance?.slug}" /><br />

				                    <span class='button'>
				                        <input type="submit" onClick="this.blur()" value="Upload"/>
				                        <img id="spinner" style="display: none" src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>
				                    </span>
							            </div>
							        </g:form>
							    </gui:accordionElement>
							</gui:accordion>
            </div>

