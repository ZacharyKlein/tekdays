<h3>Latest Forum Posts</h3>
<table>
  <thead>
    <tr>
      <th>Author</th>
      <th>Subject</th>
      <th>Content</th>
    </tr>
  </thead>
  <g:each in="${messages}" var="msg">
    <tr>
      <td>
        <g:link controller="tekUser" action="show" id="${msg.author.id}">
          ${msg.author}
        </g:link>
      </td>
      <td>
        <g:link controller="message" action="topic" id="${msg.id}">
          ${msg.subject}
        </g:link>
      </td>
      <td>
        ${msg.content[0..Math.min(msg.content.size() -1, 24)]}
        ${msg.content.size() > 25 ? '...' : ''}
      </td>
    </tr>
  </g:each>
</table>
<g:link controller="message" action="forum" id="${event.id}">
  View Forum.
</g:link>

