

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <gui:resources components="['accordian']"/>
        <title>TekDays &rarr; Forum: ${topic?.subject}</title>
    </head>
    <body class="yui-skin-sam">
        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${resource(dir:'')}">Home</a>
            </span>
            <span class="menuButton">
              <link:eventForums id="${eventId}">
                Return To Forum
              </link:eventForums>
            </span>
            <span class="menuButton">
            <!-- START:new -->
              <g:link class="create" action="create" id="${topic?.event.id}">New Topic
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
                             <td style="padding:  20px 5px 40px 10px; width120px;"><link:profile username="${topic.author.username}"> ${topic.author}</link:profile><br/>
                                <g:showAvatar username="${topic.author.username}" height="100" width="90" align="absmiddle" />
                             </td>
                             <td style="padding:  20px 5px 40px 10px">

                               <p>${topic?.content} <g:ifIsAuthor id="${topic?.id}" > &nbsp; <span class="button"><g:link action="edit" id="${topic.id}">(Edit)</g:link></span></g:ifIsAuthor></p></td>
                        </tr>
                        <g:each in="${posts}" status="i" var="post">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                                <td style="padding:  20px 5px 40px 10px; width:120px;"><g:link controller="tekUser" action="show" id="${post.author.id}" params='["eventId":"${params.eventId}"]'> ${post.author}</g:link><br/>
                                    <g:showAvatar username="${post.author.username}"/>
                                </td>
                                <td style="padding:  20px 5px 40px 10px">

                                    <p>${post.content} &nbsp; <g:ifIsAuthor id="${post?.id}" ><span class="button"><g:link action="edit" id="${post.id}">(Edit </g:link></span>|<span class="button"><g:link action="delete" id="${post.id}"> Delete)</g:link></span></g:ifIsAuthor></p><br />

                                </td>

                            </tr>

                        </g:each>



                        <tr class="prop">

                            <td valign="top" class="name">
                                <label for="content">Reply</label>
                            </td>
                            <td valign="top">

                                         <g:form action="reply" method="post" >

                                            <textarea  style="width:850px" rows="5" cols="60" name="content"></textarea>
                                            <input type="hidden" name="author.id" value="${loggedInUserInfo(field:'id')}" />
                                            <input type="hidden" name="eventId" value="${params.eventId}" />
                                            <input type="hidden" name="topic" value="${topic.id}">
                                            <br />

                                                <span class="button"><input type="submit" value="Submit" /></span>

                                        </g:form>

                            </td>

                        </tr>

                    </tbody>
                </table>



            <div class="paginateButtons">

            </div>
        </div>
    </body>
</html>

