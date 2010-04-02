

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title>TekDays &rarr; ${event?.name} Blog</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><link:newPost slug="${event?.slug}">New Post</link:newPost></span>
        </div>
        <div class="body">
            <h1>${event?.name} Blog</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${postInstance?.id}" />
                <g:hiddenField name="version" value="${postInstance?.version}" />
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
                </fieldset>
                <div>
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

