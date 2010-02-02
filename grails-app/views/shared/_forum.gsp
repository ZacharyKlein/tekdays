<h1 style="display:inline; margin-right:40px;">Forum</h1><g:remoteLink slug="${event?.slug}">New Topic</g:remoteLink>

<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
    <table class="topicList">
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

                <td style="width:450px; padding:  20px 5px 20px 10px">
                    <g:link action="topic" id="${forumTopic.id}" eventId="${params.id}" >${fieldValue(bean:forumTopic, field:'subject')}</g:link>
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

<div class="paginateButtons">
    <g:paginate total="${forumCount}" />
</div>