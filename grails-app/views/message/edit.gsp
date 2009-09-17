

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <gui:resources components="['richEditor']" />
        <title>Edit Message</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Message List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Message</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Message</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${messageInstance?.id}" />
                <input type="hidden" name="version" value="${messageInstance?.version}" />
                <div class="dialog">
                    <gui:richEditor 
                        id="content"
                        name="content"
                        value="${messageInstance.content}"
                        height="200"
                        width="100%"
                        dompath="false"
                    />
                        <script  type="text/javascript">
                            GRAILSUI.content._defaultToolbar.titlebar = ' ';
                        </script>
                    <!--<textarea rows="5" cols="40" style="width:1024px" name="content">${fieldValue(bean:messageInstance, field:'content')}</textarea>-->
                               
                </div>
                <div>
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
