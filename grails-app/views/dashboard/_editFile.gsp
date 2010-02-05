<span class="botton" style="">
    <g:remoteLink controller="attachment" action="list" update="attachmentList" params="[slug:params.slug]">Back</g:remoteLink>
</span>
<g:hasErrors bean="${attachmentInstance}">
    <div class="errors">
        <g:renderErrors bean="${attachmentInstance}" as="list" />
    </div>
</g:hasErrors>
<g:formRemote
    name="updateAttachmentForm"
    url="[controller:'attachment', action:'updateAttachment']"
    update="attachmentList"
    onSuccess="clearAttachment(e)"
    onLoading="showSpinner(true)"
    onComplete="showSpinner(false)">

    <input type="hidden" name="id" value="${attachmentInstance?.id}" />
    <input type="hidden" name="version" value="${attachmentInstance?.version}" />

    <div class="dialog">
        <fieldset>
            <legend>Edit File: ${attachmentInstance.displayName ?: attachmentInstance.name}</legend>
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
                    <input type="hidden" id="eventId" name="eventId" value="${tekEventInstance?.id}" />
                  </p>
            <input type="hidden" id="slug" name="slug" value="${params.slug}" /><br />

            <span class='button'>
                <g:remoteLink controller="attachment" onClick="this.blur()" action="updateFile" params="[slug:params.slug, id:attachmentInstance.id]">Update</g:remoteLink>
                <img id="spinner" style="display: none" src="<g:createLinkTo dir='/images' file='spinner.gif'/>"/>
            </span>
            <span class="button">
                <g:remoteLink controller="attachment" action="delete" update="attachmentList" onclick="return confirm('Are you sure?');" params="[slug:params.slug, id:attachmentInstance.id]">Delete</g:remoteLink>
            </span>


     </fieldset>
    </div>
</g:formRemote>

