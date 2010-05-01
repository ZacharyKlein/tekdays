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

      <table>
        <thead>
          <tr>
            <th>Display Name</th>
            <th>File (Click to Download)</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

              <td>${fieldValue(bean: attachmentInstance, field: "displayName")}</td>

              <td><a href="${resource(dir:'/srv/www/tekdays/events/${attachmentInstance?.event?.slug}',file:attachmentInstance.name)}">Download</a></td>

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

      <br/>
      
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

      <div class="paginateButtons">
          <g:paginate total="${attachmentInstanceTotal}" />
      </div>
      
    </div>
  </body>
</html>

