

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Sponsor List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Sponsor</g:link></span>
        </div>
        <div class="body">
            <h1>Sponsor List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="website" title="Website" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="logo" title="Logo" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorInstanceList}" status="i" var="sponsorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sponsorInstance.id}">${fieldValue(bean:sponsorInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'website')}</td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'logo')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
