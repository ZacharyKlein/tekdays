

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Forum</title>
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
                        
                        
                                <th>Subject</th>
                                             
                                <th>Author</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${forumTopics}" status="i" var="forumTopic">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                              
                            <td><g:link action="showTopic" id="${forumTopic.id}">${forumTopic?.subject}</g:link></td>
                                           
                            <td>${forumTopic?.author}</td>
                                              
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${count}" />
            </div>
        </div>
    </body>
</html>
