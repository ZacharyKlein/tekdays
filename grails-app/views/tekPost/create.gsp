

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Blog Post</title>
    </head>
    <body>
        <div class="body"><br />
            <h1>The TekDays Blog</h1><br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekPostInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekPostInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
              <fieldset>
                <legend>New Post</legend>
                <p>
                  <label for="title" class="editdetail">Title:</label>
                  <input type="text" name="title" id="title" class="editdetail" style="width:625px;"/> <%-- UGLINESS BEGINS TO OCCUR; YOU BETTER FIX THIS --%>
                </p>
    
                <p>
                  <g:textArea name="body" cols="100" rows="9" value="${tekPostInstance?.body}" />
                </p>
               </fieldset>
                <div><br />
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
