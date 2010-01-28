<span style="text-align:center">
  <h1>${event}</h1>
</span>
<p class="homesum">
<table>
  <tr>
    <td>
      Start Date: <g:formatDate format="MMM/dd/yyyy" date="${event?.startDate}"/>
    </td>
    <td>
      <g:if test="${event?.endDate}">
        End Date: <g:formatDate format="MMM/dd/yyyy" date="${event?.endDate}"/>
      </g:if>
    </td>
  </tr>
  <tr>
    <td>
      Venue: ${event?.venue}
    </td>
    <td>
      Number of potential attendees: ${event?.respondents?.size()}
    </td>
  </tr>
</table>
</p>

