

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Message List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${resource(dir:'')}">Home</a>
            </span>
            <span class="menuButton">
            <!-- START:new -->
              <g:link class="create" action="create" 
                  params='["event.id":"${event?.id}"]'>New Message
              </g:link>
            <!-- END:new -->
            </span>
        </div>
        <div class="body">
            <h1>Message List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                                <g:sortableColumn property="id" title="Id" />
                        
                                <g:sortableColumn property="subject" title="Subject" />
                        
                                <g:sortableColumn property="content" title="Content" />
                        
                                <th>Parent</th>
                            
                                <th>Author</th>
                            
                                <th>Event</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean:messageInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:messageInstance, field:'subject')}</td>
                        
                            <td>${fieldValue(bean:messageInstance, field:'content')}</td>
                        
                            <td>${fieldValue(bean:messageInstance, field:'parent')}</td>
                        
                            <td>${fieldValue(bean:messageInstance, field:'author')}</td>
                        
                            <td>${fieldValue(bean:messageInstance, field:'event')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
