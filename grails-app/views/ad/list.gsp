

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'ad.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'ad.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="imageLocation" title="${message(code: 'ad.imageLocation.label', default: 'Image Location')}" />
                        
                            <g:sortableColumn property="imageName" title="${message(code: 'ad.imageName.label', default: 'Image Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${adInstanceList}" status="i" var="adInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: adInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: adInstance, field: "imageLocation")}</td>
                        
                            <td>${fieldValue(bean: adInstance, field: "imageName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${adInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
