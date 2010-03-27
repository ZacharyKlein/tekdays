

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
				<meta name="dashTab" content="forum" />
        <title>Edit Message</title>
    </head>
    <body>
       <div class="nav">
            <span><g:link action="forum"  params="[slug: tekEventInstance.slug]">Forum</g:link></span> &nbsp; > &nbsp; ${messageInstance?.subject}
      </div>
        <h1>${messageInstance.subject}</h1>
        <br/>
        <fieldset>
            <legend>Edit Message</legend>
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
                    <textarea rows="10" style="width:700px"  name="content">${fieldValue(bean:messageInstance, field:'content')}</textarea>
                               
                </div>
                <div>
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </fieldset>
    </body>
</html>
