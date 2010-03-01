<span style="text-align:center">
  <h1>${tekEventInstance}</h1>
</span>
<p class="homesum">
<table>
  <tr>
    <td>
      Start Date: <g:formatDate format="MMM/dd/yyyy" date="${tekEventInstance?.startDate}"/>
    </td>
    <td>
      <g:if test="${tekEventInstance?.endDate}">
        End Date: <g:formatDate format="MMM/dd/yyyy" date="${tekEventInstance?.endDate}"/>
      </g:if>
    </td>
  </tr>
  <tr>
    <td>
      Venue: ${tekEventInstance?.venue}
    </td>
    <td>
      Number of potential attendees: ${tekEventInstance?.respondents?.size()}
    </td>
  </tr>
</table>
</p>

