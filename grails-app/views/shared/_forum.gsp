<h1 style="display:inline; margin-right:40px;">${event.name} - Forum</h1>
<g:remoteLink controller="message" action="forum" update="topicList" params="[slug:event.slug]">Forum Home</g:remoteLink> 
<g:remoteLink controller="message" action="newTopic" update="topicList" params="[slug:event.slug]">New Topic</g:remoteLink>  
<br /><br />

<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>

    <div id="topicList">
        <g:render template="/shared/topicList" model="${[forumTopics:forumTopics, forumCount:forumCount]}" />
    </div>

