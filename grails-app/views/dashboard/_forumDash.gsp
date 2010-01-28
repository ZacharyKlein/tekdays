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
        <link:profile username="${msg?.author.username}">
          ${msg?.author}
        </link:profile>
      </td>
      <td>
        <g:link controller="message" action="topic" id="${msg.id}">
          ${msg?.subject}
        </g:link>
      </td>
      <td>
        ${msg.content[0..Math.min(msg?.content?.size() -1, 24)]}
        ${msg.content.size() > 25 ? '...' : ''}
      </td>
    </tr>
  </g:each>
</table>
<link:eventForum slug="${event?.slug}">
  View Forum.
</link:eventForum>

