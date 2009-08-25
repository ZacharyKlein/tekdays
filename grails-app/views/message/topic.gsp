

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
            <h1>${topic?.subject}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>


            <table style="width:1024px" >


                    <tbody>
                        <tr id="forumTopic">
                             <td style="padding:  20px 5px 40px 10px; width120px;"><g:link controller="tekUser" action="show" id="${topic.author.id}"> ${topic.author}</g:link><br/>
                                <g:showAvatar username="${topic.author.username}" height="100" width="90" align="absmiddle" />
                             </td>
                             <td style="padding:  20px 5px 40px 10px">${topic?.content}</td>
                        </tr>
                        <g:each in="${posts}" status="i" var="post">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                                <td style="padding:  20px 5px 40px 10px; width:120px;"><g:link controller="tekUser" action="show" id="${post.author.id}"> ${post.author}</g:link><br/>
                                    <g:showAvatar username="${post.author.username}"/>
                                </td>
                                <td style="padding:  20px 5px 40px 10px">${post.content}</td>

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
