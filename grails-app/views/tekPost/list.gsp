

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Blog</title>
    </head>
    <body>
        <div class="body"><br />
          <h1>The TekDays Blog</h1>
          <g:if test="${flash.message}">
            <div class="transparentMessage">${flash.message}</div>
          </g:if>
          <g:each in="${tekPostInstanceList}" status="i" var="tekPostInstance">
            <div class="grayBox">
              <h2 style="margin-bottom:0; padding-bottom:0;">${tekPostInstance?.title}</h2>
              <p class="desc">posted <g:formatDate format="EEEE, MMMM dd, yyyy" date="${tekPostInstance?.dateCreated}" /></p><br />
              ${tekPostInstance?.body}
            </div><br />
          </g:each>
          <div class="paginateButtons">
            <g:paginate total="${tekPostInstanceTotal}" />
          </div>
        </div>
    </body>
</html>
