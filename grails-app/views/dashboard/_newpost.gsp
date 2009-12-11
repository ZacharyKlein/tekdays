<br />
<h3>New Blog Post</h3>
<g:form action="save" controller="post" action="save" method="post" >
    <p>
        <label for="title">Title:</label>
        <input type="text" name="title" id="editdetail" size="106" />
    </p>
    <p>
        <gui:richEditor
            id="content"
            name="content"
            value="${postInstance?.content}"
            height="200"
            width="100%"
            titlebar="Content"
            dompath="false"
        />
        <script  type="text/javascript">
            GRAILSUI.content._defaultToolbar.titlebar = ' ';
        </script>
    </p>
    <input type="hidden" name="eventId" value="${eventId}">
    <span class="button"><g:submitButton name="create" class="save" value="Post" /></span>
</g:form>

