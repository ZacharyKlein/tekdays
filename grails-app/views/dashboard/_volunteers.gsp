<h3>Volunteers</h3>
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Email Address</th>
      <th>Web Site</th>
    </tr>
  </thead>
  <g:each in="${volunteers}" var="volunteer">
    <tr>
      <td>
        <link:profile username="${volunteer?user.username}">
          ${volunteer?.user.profile?.fullName}
        </link:profile>
      </td>
      <td><a href="mailto:${volunteer?.user.email}">${volunteer?.user.email}</a></td>
      <td><a href="http://${volunteer?.user.profile?.website}">${volunteer?.user.profile?.website}</a></td>
    </tr>
  </g:each>
</table>

