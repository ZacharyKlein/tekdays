

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Sponsorship List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Sponsorship</g:link></span>
        </div>
        <div class="body">
            <h1>Sponsorship List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Event</th>
                   	    
                   	        <th>Sponsor</th>
                   	    
                   	        <g:sortableColumn property="contributionType" title="Contribution Type" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="notes" title="Notes" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorshipInstanceList}" status="i" var="sponsorshipInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sponsorshipInstance.id}">${fieldValue(bean:sponsorshipInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:sponsorshipInstance, field:'event')}</td>
                        
                            <td>${fieldValue(bean:sponsorshipInstance, field:'sponsor')}</td>
                        
                            <td>${fieldValue(bean:sponsorshipInstance, field:'contributionType')}</td>
                        
                            <td>${fieldValue(bean:sponsorshipInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:sponsorshipInstance, field:'notes')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorshipInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
