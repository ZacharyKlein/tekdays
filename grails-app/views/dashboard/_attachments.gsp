<h3>Uploaded Files</h3>
<table>
  <thead>
    <tr>
      <th>File Name</th>
      <th>Date Uploaded</th>
    </tr>
  </thead>
  <g:each in="${attachments}" var="attachment">
    <tr>
      <td><a href="${attachment.location}">${attachment.name}</a></td>
      <td>${attachment.dateCreated}</td>
    </tr>
  </g:each>
</table>
<g:link controller="attachment" action="create" id="${event?.id}">Add attachment</g:link>


