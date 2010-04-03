<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
				<meta name="dashTab" content="forum" />
        <gui:resources components="['accordian']"/>
        <title>TekDays &rarr; Forum: ${topic?.subject}</title>
    </head>
    <body class="yui-skin-sam">
      <div class="nav">
          <span><g:link action="forum"  params="[slug: tekEventInstance.slug]">Forum</g:link></span>
          &nbsp; > &nbsp; ${topic?.subject}
          &nbsp; > &nbsp; <a href="#reply">Reply</a>

      </div>
      <div>
        <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
        </g:if>
				<div class="list">
          <table>
            <tbody>
              <tr id="forumTopic">
                <td style="padding:  20px 5px 40px 10px; width:120px;">
                  <img class="avatar" src="${createLink(controller:'tekUser', action:'displayAvatar', params:[username:topic.author.username])}" /><br/>
									<link:profile username="${topic.author.username}"> ${topic.author}</link:profile>
                </td>
                <td style="padding:  20px 5px 40px 10px">
                 <p>${topic?.content} </p>
                </td>
              </tr>

              <g:each in="${posts}" status="i" var="post">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                  <td style="padding:  20px 5px 40px 10px; width:120px;">
                    <g:link controller="tekUser" action="show" id="${post.author.id}" params='["eventId":"${params.eventId}"]'> ${post.author}</g:link><br/>
                    <td:showAvatar username="${post.author.username}"/>
                  </td>
                  <td style="padding:  20px 5px 40px 10px">

                    <p>${post.content}</p><br />
                  </td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
        <a name="reply"></a>
        <br/>
				<fieldset>
          <legend>Reply</legend>
           <g:form action="reply" method="post" >
            <textarea  style="width:700px" rows="10" cols="60" name="content">${reply?.content}</textarea>
            <input type="hidden" name="author.id" value="${loggedInUserInfo(field:'id')}" />
            <input type="hidden" name="slug" id="slug" value="${tekEventInstance.slug}" />
            <input type="hidden" name="topic" value="${topic.id}">
            <br />
            <span class="button"><input type="submit" value="Reply" /></span>
          </g:form>
				</fieldset>


        <div class="paginateButtons">

        </div>
      </div>
    </body>
</html>