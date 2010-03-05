

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; Users</title>
    </head>
    <body>

        <div class="body">
            <h1>TekDays Users</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                   	        <g:sortableColumn property="avatar" title="Avatar" />

                   	        <g:sortableColumn property="fullName" title="Full Name" />

                   	        <g:sortableColumn property="username" title="Username" />

                   	        <g:sortableColumn property="website" title="Website" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tekUserInstanceList}" status="i" var="tekUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><td:showAvatar username="${tekUserInstance.username}" height="40" width="40" /></td>

                            <td><td:displayFullName username="${tekUserInstance.username}" /></td>

                            <td><g:link action="show" id="${tekUserInstance.id}">${tekUserInstance.username}</g:link></td>

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

