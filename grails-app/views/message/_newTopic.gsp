
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${messageInstance}">
<div class="errors">
    <g:renderErrors bean="${messageInstance}" as="list" />
</div>
</g:hasErrors>
<g:formRemote
    name="newTopicForm"
    url="[controller:'message', action:'saveTopic']"
    update="topicList">
    <div class="dialog">
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subject">Subject:</label>
                    </td>
                    <td valign="top">
                        <input type="text" style="width:800px" id="subject" name="subject"
                            value="${messageInstance?.subject}"/>
                    </td>
                </tr> 
                
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="content">Content:</label>
                    </td>
                    <td valign="top">
                      <textarea  style="width:800px" rows="16" cols="50" name="content">${messageInstance?.content}</textarea>
                    </td>
                </tr> 
                

            </tbody>
        </table>
        
       <input type="hidden" name="author.id" value="${loggedInUserInfo(field:'id')}" />
        <input type="hidden" name="slug" value="${event.slug}" />
        
    </div>
    <div>
        <span class="button"><input class="save" type="submit" value="Post Topic" /></span>
    </div>
</g:formRemote>
