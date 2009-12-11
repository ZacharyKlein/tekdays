<p>New Blog Post</p>
<g:form action="save" controller="post" action="save" method="post" >
    <input type="text" name="title" />
    <textarea name="content" cols="60" rows="3"
            style="width:100%; height:60px">${postInstance?.content}</textarea>
    <input type="hidden" name="eventId" value="${eventId}">
    <span class="button"><g:submitButton name="create" class="save" value="Post" /></span>
</g:form>

