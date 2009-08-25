

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
            <h1>Forum</h1>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
                <table class="topicList" style="width:1024px" >
                    <thead>
                        <tr>
                   	         <th>Topic</th>
                   	         <th>Author</th>
                             <th>Posts</th>
                             <th>Last Post</th>
                        </tr>
                    </thead>

                    <tbody>
                    <g:each in="${forumTopics}" status="i" var="forumTopic">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                            <td style="width:450px; padding:  20px 5px 20px 10px"> <g:link action="topic" id="${forumTopic.id}">${fieldValue(bean:forumTopic, field:'subject')}</g:link></td>


                            <td style="padding:  20px 5px 20px 10px"><g:link controller="tekUser" action="show" id="${forumTopic?.author.id}"> ${forumTopic?.author}</g:link></td>
                            <td style="padding:  20px 5px 20px 10px">3</td>
                            <td style="padding:  20px 5px 20px 10px">March 15, 2008 10:38 AM by a User</td>



                        </tr>
                    </g:each>
                    </tbody>
                </table>

            <div class="paginateButtons">
                <g:paginate total="${count}" />
            </div>
        </div>
    </body>
</html>
