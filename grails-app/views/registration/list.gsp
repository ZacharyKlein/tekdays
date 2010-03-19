

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'registration.label', default:'Registration')}" />
        <title>TekDays &rarr; Registrations</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><link:dashboard slug="${params?.slug}" >Back to Event Dashboard</link:dashboard></span>
        </div>
        <div class="body">
            <h1>Registrations</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                   	        <g:sortableColumn property="id" title="${message(code:'registration.id.label', default:'No.')}" />

                   	        <g:sortableColumn property="firstName" title="${message(code:'registration.firstName.label', default:'Name')}" />

                   	        <g:sortableColumn property="email" title="${message(code:'registration.email.label', default:'Email')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${registrationInstanceList}" status="i" var="registrationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean:registrationInstance, field:'id')}</td>

                            <td>${fieldValue(bean:registrationInstance, field:'firstName')} ${fieldValue(bean:registrationInstance, field:'lastName')}</td>

                            <td>${fieldValue(bean:registrationInstance, field:'email')}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

