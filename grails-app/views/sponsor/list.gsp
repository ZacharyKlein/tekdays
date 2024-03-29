

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>TekDays &rarr; All Sponsors</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><a href="#" onclick="javascript:history.back();">Back</a></span>
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

                   	        <g:sortableColumn property="id" title="${message(code:'sponsor.id.label', default:'Id')}" />

                   	        <g:sortableColumn property="name" title="${message(code:'sponsor.name.label', default:'Name')}" />

                   	        <g:sortableColumn property="website" title="${message(code:'sponsor.website.label', default:'Website')}" />

                   	        <g:sortableColumn property="description" title="${message(code:'sponsor.description.label', default:'Description')}" />

                   	        <g:sortableColumn property="logo" title="${message(code:'sponsor.logo.label', default:'Logo')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorInstanceList}" status="i" var="sponsorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${sponsorInstance.id}">${fieldValue(bean:sponsorInstance, field:'id')}</g:link></td>

                            <td>${fieldValue(bean:sponsorInstance, field:'name')}</td>

                            <td>${fieldValue(bean:sponsorInstance, field:'website')}</td>

                            <td>${fieldValue(bean:sponsorInstance, field:'description')}</td>

                            <td><img src="${createLink(action:'displayLogo', id:sponsorInstance?.id)}" /></td>

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

