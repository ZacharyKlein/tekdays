<html>
  <head>
      <gui:resources components="['richEditor', 'datePicker', 'accordion', 'autoComplete']" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="dashboard" />
      <meta name="dashTab" content="editLogo" />
      <title>TekDays  &rarr; Edit Event Details</title>
  </head>
  <body>
    <div class="nav">
	    <span>Edit Details</span>
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

          <input type="hidden" name="organizer.id" id="organizer.id" value="${tekEventInstance?.organizer?.id}" />
          
          <fieldset>
            <legend>Banner & Logo</legend>
            <div style="height:200px">
              <div style="float:left">
                <label for="logoFile">
                  <g:message code="tekEvent.logo.label" default="Logo" />
                </label><br/>
                <input type="file" id="logoFile" name="logoFile" /><br/>
                <p>Logo will be displayed at 120x120 pixels</p>
              </div>
               <img style="width:120px; float:right" src="${createLink(controller:'tekEvent', action:'displayLogo', params:[slug:tekEventInstance.slug])}" />

            </div>

            <div style="height:100px">
              <div style="float:left">
                <label for="banner">
                  <g:message code="tekEvent.banner.label" default="Banner" />
                </label><br/>
                <input type="file" id="banner" name="banner" /><br/>
                <p>Banner will be displayed at 120x1000 pixels</p>
                
              </div>
                <img src="${createLink(action:'displayBanner', controller:'tekEvent', params:['slug':tekEventInstance.slug])}" style="float:right; width:360px"/>
              
            </div>

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

