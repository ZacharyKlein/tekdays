

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekUser List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New TekUser</g:link></span>
        </div>
        <div class="body">
            <h1>TekUser List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="fullName" title="Full Name" />
                        
                   	        <g:sortableColumn property="userName" title="User Name" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                   	        <g:sortableColumn property="website" title="Website" />
                        
                   	        <g:sortableColumn property="bio" title="Bio" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tekUserInstanceList}" status="i" var="tekUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tekUserInstance.id}">${fieldValue(bean:tekUserInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:tekUserInstance, field:'fullName')}</td>
                        
                            <td>${fieldValue(bean:tekUserInstance, field:'userName')}</td>
                        
                            <td>${fieldValue(bean:tekUserInstance, field:'email')}</td>
                        
                            <td>${fieldValue(bean:tekUserInstance, field:'website')}</td>
                        
                            <td>${fieldValue(bean:tekUserInstance, field:'bio')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tekUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
