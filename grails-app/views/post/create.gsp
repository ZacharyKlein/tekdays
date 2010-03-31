

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="blog" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title>TekDays &rarr; ${tekEventInstance?.name} Blog</title>
    </head>
    <body>
        <div class="nav">
            <span><g:link controller="post" action="list" params="[slug:tekEventInstance.slug]">Blog</g:link></span>
             &nbsp; &nbsp; >
             &nbsp; &nbsp; New Post
        </div>
        <div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                <fieldset>
                  <legend>New Post</legend>
                  <p>
                    <label for="title" class="editdetail">Title:</label>
                    <g:textField name="title" style='width:360px' value="${postInstance?.title}" />
                  </p>
                  <p>
                    <g:textArea name="content" cols="80" rows="15" value="${postInstance?.content}" />
                  </p>
                  <p>
                    <g:hiddenField name="slug" id="slug" value="${tekEventInstance?.slug}" />
                  </p>
                  <div>
                    <span class="button"><g:submitButton name="create" class="save" value="Post" /></span>
	                </div>
                </fieldset>
                </div>

            </g:form>
        </div>
    </body>
</html>

