

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Message</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            
            <span class="menuButton">
              <g:link class="list" action="list" id="${messageInstance?.event?.id}">
                Message List
              </g:link>
            </span>
            
        </div>
        <div class="body">
            
            <h1>${messageInstance?.event?.name} Forum - New Message</h1>
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                            
                            <g:if test="${messageInstance.parent}">
                              <input type="hidden" name="parent.id" value="${messageInstance.parent.id}" />
                              <tr class="prop">
                                  <td valign="top" class="name">
                                      <label>In Reply to:</label>
                                  </td>
                                  <td valign="top" class="value"> 
                                      ${messageInstance.parent.author}
                                  </td>
                              </tr> 
                            </g:if>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subject">Subject:</label>
                                </td>
                                <td valign="top" 
                                    class="value ${hasErrors(bean:messageInstance,field:'subject','errors')}">
                                    <input type="text" style="width:550px" id="subject" name="subject" 
                                        value="${fieldValue(bean:messageInstance,field:'subject')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content">Content:</label>
                                </td>
                                <td valign="top" 
                                    class="value ${hasErrors(bean:messageInstance,field:'content','errors')}">
                                  <textarea  style="width:550px" rows="5" cols="60" name="content">${messageInstance.content}</textarea>
                                </td>
                            </tr> 
                            

                        </tbody>
                    </table>
                    
		     <input type="hidden" name="author.id" value="${loggedInUserInfo(field:id)}" />
                    <input type="hidden" name="event.id" value="${eventId}" />
                    
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
