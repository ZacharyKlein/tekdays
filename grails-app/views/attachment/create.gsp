

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="files" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title>TekDays &rarr; Upload a File</title>
    </head>
    <body>
          <div class="nav">
            <span><g:link action="list" params="[slug:tekEventInstance.slug]">Files</g:link></span> &nbsp; > &nbsp; Upload
        </div>
        <div>
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
		              <g:textField style="width:300px" name="displayName" value="${attachmentInstance?.displayName}" />
		            </p>
		            <p>
		              <label for="file" class="editdetail">File:</label>
		              <input type="file" id="file" name="file" />
		            </p>
		            <p>
		              <label for="description" class="editdetail">Description: (optional)</label>
		              <textarea rows="5" cols="80" name="description" id="description">${attachmentInstance?.description}</textarea>
		            </p>
		            <p>
		              <input type="hidden" id="slug" name="slug" value="${tekEventInstance.slug}" />
		            </p>
		             <span class="button"><g:submitButton name="create" class="save" value="Upload" /></span>
		          </fieldset>
		        </div>
		      </g:form>

        </div>
    </body>
</html>

