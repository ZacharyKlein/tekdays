<g:applyLayout name="main">
<gui:resources components="['datePicker']"/>
  <fieldset
    <legend>New Event</legend>
      <p>
        <label for="name" class="editdetail">Name:</label>
        <input type="text" id="name" name="name" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
      </p>
      <p>
        <label for="city" class="editdetail">* City:</label>
        <input type="text" id="city" name="city" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
      </p>
      <p>
        <label for="startDate" class="editdetail">Start Date:</label>
        <gui:datePicker name="startDate" id='startDate' value="${tekEventInstance?.startDate}" includeTime="false"/>
      <p>
        <label for="endDate" class="editdetail">End Date:</label>
        <g:datePicker name="endDate" precision="day"
              value="${tekEventInstance?.endDate}" >
        </g:datePicker>
      </p>
  </fieldset>
</g:applyLayout>

