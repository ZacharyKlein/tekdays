<html>
  <head>
      <gui:resources components="['richEditor', 'datePicker', 'accordion', 'autoComplete']" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="dashboard" />
      <meta name="dashTab" content="editDate" />
      <title>TekDays  &rarr; Edit Event Details</title>
  </head>
  <body>
    <div class="nav">
	    <span>Edit Event Dates</span>
    </div>
    <div>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${tekEventInstance}">
        <div class="errors">
          <g:renderErrors bean="${tekEventInstance}" as="list" />
        </div>
      </g:hasErrors>
    <g:form method="post" action="update" enctype="multipart/form-data">
        <input type="hidden" name="version" value="${tekEventInstance?.version}" />
        <div class="dialog">
          <fieldset>
            <legend>Dates</legend>

            <p>
              <label for="startDate" class="editdetail">Start Date:</label>
              <gui:datePicker name="startDate" id='startDate' value="${tekEventInstance?.startDate}" includeTime="false" formatString="MM/dd/yyyy"/>
            </p>
            <p>
              <label for="endDate" class="editdetail">End Date:</label>
              <gui:datePicker name="endDate" id='endDate' value="${tekEventInstance?.endDate}" includeTime="false" formatString="MM/dd/yyyy"/>
            </p>
	        <div class="formbuttons">
	          <input type="hidden" name="id" value="${tekEventInstance?.id}" />
	          <span class="button"><g:actionSubmit class="save" value="Update" /></span>
	        </div>
          </fieldset>
        </div>

      </g:form>
    </div>
  </body>
</html>

