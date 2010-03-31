

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="dashboard" />
        <meta name="dashTab" content="blog" />        
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span>Blog</span>

        </div>
        <div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="title" title="${message(code: 'post.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'post.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${postInstanceList}" status="i" var="postInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "title")}</g:link></td>
                        
                            <td><g:formatDate date="${postInstance.dateCreated}" /></td>

                        
                        </tr>
                    </g:each>
                    <g:if test="${postInstanceList.size() == 0}">
                  <tr>
                    <td id="noTopics" colspan="2" style="border-bottom-color:#ccc"><h2>No Posts</h2> <p>No Blog posts have been added yet</p></td>
                  </tr>
                </g:if>
                    </tbody>
                </table>
								 <g:form action="save" method="post" >
		                <div class="dialog" style="margin-top:10px;">
		                <fieldset>
		                  <legend>New Post</legend>
		                  <p>
		                    <label for="title" class="editdetail">Title:</label>
		                    <g:textField name="title" value="${postInstance?.title}" style="width:360px" />
		                  </p>
		                  <p>
		                    <g:textArea name="content" cols="80" rows="15" value="${postInstance?.content}" />
		                  </p>
		                  <p>
		                    <g:hiddenField name="slug" id="slug" value="${tekEventInstance?.slug}" />
		                  </p>
		                </fieldset>
		                </div>
		                <div>
		                    <span class="button"><g:submitButton name="create" class="save" value="Post" /></span>
		                </div>
		            </g:form>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${postInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
