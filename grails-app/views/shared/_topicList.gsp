<table>
    <thead>
        <tr>
            <th>Topic</th>
            <th>Author</th>
            <th>Posts</th>
            <th>Last Post</th>
        </tr>
    </thead>

    <tbody>
    
    <g:if test="${forumTopics}">
        <g:each in="${forumTopics}" status="i" var="forumTopic">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                <td style="width:450px; padding:  20px 5px 20px 10px">
                    <g:remoteLink controller="message" action="topic" update="topicList" params="[id:forumTopic.id]">${fieldValue(bean:forumTopic, field:'subject')}</g:remoteLink>
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
        <tr><td colspan="4">
            <div class="paginateButtons">
                <g:paginate total="${forumCount}" />
            </div></td>
        </tr>
    </g:if>
    
    <g:else>
        <tr>
            <td id="noTopics" colspan="4"><h2>Your Event Forum;</h2> <p>click "New Topic" to start a discussion!</p></td>
        </tr>
    </g:else>
    </tbody>
</table>