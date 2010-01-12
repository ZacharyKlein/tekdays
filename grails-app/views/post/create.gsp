

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
        </div>
        <div class="body">
            <h1>${event?.name} - Blog</h1>
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
                    <g:textField name="title" value="${postInstance?.title}" />
                  </p>
                  <p>
                    <g:textArea name="content" cols="40" rows="5" value="${postInstance?.content}" />
                  </p>
                  <p>
                    <g:hiddenField name="eventId" id="eventId" value="${event?.id}" />
                  </p>
                </fieldset>
                </div>
                <div>
                    <span class="button"><g:submitButton name="create" class="save" value="Post" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

