<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="dashboard" />
				<meta name="dashTab" content="forum" />
        <title>Forum</title>
    </head>
    <body>
	    <div class="nav">
	        <span>
	            Forum &nbsp;
	        </span>
	    </div>
	 

	    <g:if test="${flash.message}">
		    <div class="message">${flash.message}</div>
	    </g:if>
      <table class="topicList"  >
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

                  <td style="min-width:250px; padding:  20px 5px 20px 10px">
                      <g:link action="topic" id="${forumTopic.id}">${fieldValue(bean:forumTopic, field:'subject')}</g:link>
                  </td>
                  <td style="padding:  20px 5px 20px 10px"><link:profile username="${forumTopic?.author.username}">
                      ${forumTopic?.author}</link:profile>
                  </td>
                  <td style="padding:  20px 5px 20px 10px">
                      <td:postCount topic="${forumTopic.id}"/>
                  </td>
                  <td style="padding:  20px 5px 20px 10px">
                      <td:lastPost topic="${forumTopic.id}"/>
                  </td>

              </tr>
          </g:each>
          </tbody>
      </table>
			<fieldset>
				<legend>Post New Topic</legend>

	      <g:if test="${flash.message}">
	      <div class="message">${flash.message}</div>
	      </g:if>
	      <g:hasErrors bean="${messageInstance}">
	      <div class="errors">
	          <g:renderErrors bean="${messageInstance}" as="list" />
	      </div>
	      </g:hasErrors>
	      <g:form action="saveTopic" method="post" >
	          <div class="dialog">
	              <table>
	                  <tbody>
	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="subject">Subject:</label>
	                          </td>
	                          <td valign="top"
	                              class="value ${hasErrors(bean:messageInstance,field:'subject','errors')}">
	                              <input type="text" style="width:500px" id="subject" name="subject"
	                                  value="${fieldValue(bean:messageInstance,field:'subject')}"/>
	                          </td>
	                      </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="content">Content:</label>
	                          </td>
	                          <td valign="top"
	                              class="value ${hasErrors(bean:messageInstance,field:'content','errors')}">
	                            <textarea  style="width:500px" rows="10" cols="60" name="content">${messageInstance.content}</textarea>
	                          </td>
	                      </tr>


	                  </tbody>
	              </table>

	          <input type="hidden" name="author.id" value="${loggedInUserInfo(field:'id')}" />
	          </div>
	          <div>
	              <span class="button"><input class="save" type="submit" value="Submit" /></span>
	          </div>
	      </g:form>
			</fieldset>
      <div class="paginateButtons">
          <g:paginate total="${count}" />
      </div>

    </body>
</html>