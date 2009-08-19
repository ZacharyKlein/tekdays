

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>${entityName} List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="${message(code:'registration.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="firstName" title="${message(code:'registration.firstName.label', default:'First Name')}" />
                        
                   	        <g:sortableColumn property="lastName" title="${message(code:'registration.lastName.label', default:'Last Name')}" />
                        
                   	        <g:sortableColumn property="email" title="${message(code:'registration.email.label', default:'Email')}" />
                        
                   	        <g:sortableColumn property="confirmed" title="${message(code:'registration.confirmed.label', default:'Confirmed')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${registrationInstance.id}">${fieldValue(bean:registrationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:registrationInstance, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:registrationInstance, field:'lastName')}</td>
                        
                            <td>${fieldValue(bean:registrationInstance, field:'email')}</td>
                        
                            <td>${fieldValue(bean:registrationInstance, field:'confirmed')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${registrationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
