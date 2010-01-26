

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'volunteer.id.label', default: 'Id')}" />
                        
                            <th><g:message code="volunteer.event.label" default="Event" /></th>
                   	    
                            <th><g:message code="volunteer.user.label" default="User" /></th>
                   	    
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'volunteer.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'volunteer.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="active" title="${message(code: 'volunteer.active.label', default: 'Active')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${volunteerInstanceList}" status="i" var="volunteerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${volunteerInstance.id}">${fieldValue(bean: volunteerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: volunteerInstance, field: "event")}</td>
                        
                            <td>${fieldValue(bean: volunteerInstance, field: "user")}</td>
                        
                            <td><g:formatDate date="${volunteerInstance.lastUpdated}" /></td>
                        
                            <td><g:formatDate date="${volunteerInstance.dateCreated}" /></td>
                        
                            <td><g:formatBoolean boolean="${volunteerInstance.active}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${volunteerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
