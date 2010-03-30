

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${adInstance}">
            <div class="errors">
                <g:renderErrors bean="${adInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="ad.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${adInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imageLocation"><g:message code="ad.imageLocation.label" default="Image Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adInstance, field: 'imageLocation', 'errors')}">
                                    <g:textField name="imageLocation" value="${adInstance?.imageLocation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imageName"><g:message code="ad.imageName.label" default="Image Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adInstance, field: 'imageName', 'errors')}">
                                    <g:textField name="imageName" value="${adInstance?.imageName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="img">File:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: adInstance, field: 'imageName', 'errors')}">
                                    <input type="file" name="img" id="img" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
