
<p class="messageAuthor">${messageInstance?.author?.encodeAsHTML()}<br/>
    [avatar]<br/>
    <g:link controller="tekUser" action="show" id="${messageInstance?.author?.id}">
    (View Profile)
  </g:link>
</p>


<p class="messageContent">
    <h3>${messageInstance.subject}</h3>
    <br/>

    ${messageInstance.content}
</p>
<div class="foot">
  <g:link class="create" action="reply" id="${messageInstance?.id}">Reply</g:link>
</div>
