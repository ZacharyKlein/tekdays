

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
            <h1>Forum Thread</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="topicList">
                <div id="forumTopicPost">
                  <h3>${topic?.subject}</h3>
                                       
                        <p>${topic?.author}</p>
                        
                        <p>${topic?.content}</p>
                </div>
                <g:each in="${posts}" status="i" var="post">
                    <div class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                          
                       <h3>${post.subject}</h3>
                                       
                        <p>${post.author}</p>
                        
                        <p>${post.content}</p>
                                          
                    
                </g:each>
                   
            </div>
            <div class="paginateButtons">
                <g:paginate total="${count}" />
            </div>
        </div>
    </body>
</html>
