

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
              <link:newTopic name="${event?.name.encodeAsUnderscore()}">New Topic
              </link:newTopic>
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

                            <td style="width:450px; padding:  20px 5px 20px 10px"> <g:link action="topic" id="${forumTopic.id}" eventId="${params.id}" >${fieldValue(bean:forumTopic, field:'subject')}</g:link></td>


                            <td style="padding:  20px 5px 20px 10px"><link:profile username="${forumTopic?.author.username}"> ${forumTopic?.author}</link:profile></td>
                            <td style="padding:  20px 5px 20px 10px"><g:postCount topic="${forumTopic.id}"/></td>
                            <td style="padding:  20px 5px 20px 10px"><g:lastPost topic="${forumTopic.id}"/></td>



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
