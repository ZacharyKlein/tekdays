

<html>
  <head>
      <gui:resources components="['richEditor', 'datePicker', 'accordion', 'autoComplete']" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="dashboard" />
      <meta name="dashTab" content="edit" />
      <tm:resources />
      <title>TekDays  &rarr; Edit Event Details</title>
  </head>
  <body>
    <div class="nav">
	    <span>Edit Details</span>
    </div>
    <div>
      <g:if test="${flash.message}">
        <div id="transparentMsg">${flash.message}</div>
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
                <legend>Required Info</legend>
                <p>
                    <label for="name" class="editdetail">Name:</label>
                    <input type="text" id="name" name="name" value="${tekEventInstance?.name}"/>
                </p>
                <div style="width:200px; padding-left:10px; margin-bottom:60px">
                    <label for="city" class="editdetail">City:</label>
                    <gui:autoComplete
                        id="city"
                        controller="tekEvent"
                        action="autoCity"
                        value="${tekEventInstance?.city}"
                    />
                </div>
                <div style="width:200px; padding-left:10px; margin-bottom:60px">
                    <label for="state" class="editdetail">State/Province:</label>
                    <gui:autoComplete
                        id="state"
                        controller="tekEvent"
                        action="autoState"
                    />
                </div>
                <p>
                    <label for="city" class="editdetail">Country:</label>
                    <input type="text" id="country" name="country" value="${tekEventInstance?.country}"/>
                </p>

                <p>
                    <gui:richEditor id="description"
                                    name="description"
                                    height="150px"
                                    width="702px"
                                    dompath="false"
                                    value="${tekEventInstance?.description}" />
                    <script type="text/javascript">
                        GRAILSUI.description._defaultToolbar.titlebar = 'Description:';
                    </script>
                </p>

                <p>
                    <input type="hidden" name="organizer.id" id="organizer.id" value="${tekEventInstance?.organizer?.id}" />
                </p>

                <fieldset>
                    <legend>Many and Varied Miscellaneous Details</legend>

                    <p>
                        <label for="venue" class="editdetail">Venue:</label>
                        <input type="text" id="venue" name="venue" value="${tekEventInstance?.venue}"/>
                    </p>

                    <p>
                        <label for="flyerFile">
                            <g:message code="tekEvent.flyer.label" default="Schedule" />
                        </label><br/>
                        <input type="file" id="flyerFile" name="flyerFile" /><br/>
                        <p>(Optional) Upload an Event flyer</p>
                    </p>


                    <div class="tagsDiv">
                        <p>
                            <label for="tagList" class="editdetail">Tags:</label>
                            <gui:autoComplete id="tagList" resultName="tagList" width="500px" labelField="name" idField="id" controller="tekEvent" action="autoTags" delimChar=","/>
														<p style="margin-top:30px"><strong>Current tags</strong>: ${tekEventInstance?.tags}</p>
                         </p>
                    </div>
                </fieldset>

          </fieldset>
        </div>
        <div class="formbuttons">
          <input type="hidden" name="id" value="${tekEventInstance?.id}" />
          <span class="button"><g:actionSubmit class="save" value="Update" /></span>
        </div>
      </g:form>
    </div>
  </body>
</html>

