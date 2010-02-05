<h2>${topic?.subject}</h2>
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
<table style="width:1000px">

        <tbody>
            <tr id="forumTopic">
                <td style="padding:  20px 5px 40px 10px; width120px;">
                    <link:profile username="${topic.author.username}"> ${topic.author}</link:profile><br/>
                    <td:showAvatar username="${topic.author.username}" height="100" width="90" align="absmiddle" />
                </td>
                <td style="padding:  20px 5px 40px 10px">

                   <p>${topic?.content} <td:ifIsAuthor id="${topic?.id}" > &nbsp; (<g:link controller="message" action="edit" id="${topic.id}">Edit</g:link>)</td:ifIsAuthor></p>
                </td>
            </tr>

            <g:each in="${posts}" status="i" var="post">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                    <td style="padding:  20px 5px 40px 10px; width:120px;">
                        <g:link controller="tekUser" action="show" id="${post.author.id}" params='[slug:${event.slug}]'> ${post.author}</g:link><br/>
                        <td:showAvatar username="${post.author.username}"/>
                    </td>
                    <td style="padding:  20px 5px 40px 10px">

                        <p>${post.content}
                        <td:ifIsAuthor id="${post?.id}">
                        <br /><br/>
                         (<g:link controller="message" action="edit" id="${post.id}">Edit</g:link> <g:link class="delete" onclick="return confirm('Are you sure? This operation cannot be undone...');" >Delete</g:link></td:ifIsAuthor></p><br />
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
                        <input type="hidden" name="slug" value="${event.slug}" />
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
