<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="search" />
  <gui:resources components="['datePicker', 'accordion', 'autoComplete']" />
  <title>TekDays</title>

	<script type="text/css">

	</script>
  
  </head>
  <body>

  <div class="body">
      <div id="searchMain">

      <g:form controller="tekEvent" action="search" style="margin: 0; padding: 0">
        <h1 id="searchinstructions" style="">Search for events...</h1>
        <input style="font-size:18pt; margin:10px; width:400px; padding:3px;" id="query" type="text" name="query" />
  
        <g:actionSubmit style="font-size:18pt; background-color:#000080; color:white; margin:10px" id="searchButton" action="search" value="Search" />
        <br/>
        <gui:accordion>
          <gui:accordionElement title="Advanced Search Options">
            <div id="advSearch" style="text-align:left">
              <fieldset>
                <legend>Location</legend>

                <label for="city" class="editdetail">City:</label>
                <gui:autoComplete id="city" controller="tekEvent" action="autoCity" />

                <label for="state" class="editdetail">State/Province:</label>
                <gui:autoComplete id="state" controller="tekEvent" action="autoState" />

                <label for="country" class="editdetail">Country:</label>
                <input type="text" id="country" name="country" value=""/>
                
              </fieldset>
              
              <fieldset style="padding-bottom:25px;">
                <legend>Date</legend>
                <label for="after" class="editdetail" style="position:relative; top:10px;">After:</label>
                <gui:datePicker name="after" id='after' includeTime="false" formatString="MM/dd/yyyy"/>

                <label for="before" style="position:relative; top:10px; margin-left:15px;" class="editdetail">Before:</label>
                <gui:datePicker name="before" id='before' includeTime="false" close="true" formatString="MM/dd/yyyy"/>
              </fieldset>
               <!-- <g:actionSubmit action="advSearch" id="advSearchButton" value="Advanced Search" style="font-size:16pt; background:#009999; color:white; margin:10px; display:inline;"/>-->
            </div>
          </gui:accordionElement>

        </gui:accordion>
      </g:form>
    </div>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <br/>
<!--    <h2>&nbsp; Search Results</h2>-->
    <ul>
    <li><td:displayAd /></li>
      <g:if test="${events}">
        <g:each in="${events}" var="event">
          <li style="border:1px solid #C0C0C0; padding:10px; margin-top:10px; background:#f4f4f4">
	          <link:eventHome slug="${event?.slug}"><span style="font-size:16pt">${event}</span></link:eventHome> &nbsp; <b>${event.startDate} - ${event.endDate}</b><br/>

						<img src="<g:resource dir='${event?.logoLocation}' file='${event?.logoName}' />" style="float:left; margin:10px"/>
            <p>${event.description}</p>

	            <fieldset style="background:white;width:400px;">
		            <legend>Tags</legend>
	            <g:set var="tagCount" value="${event.tags.size() - 1}" />
	            <g:each var="t" status="i" in="${event.tags}">
	              <td:linkToSearchByTag id="${t?.id}" />
	              <g:if test="${!(i == tagCount)}">,</g:if>
	            </g:each>
	            </fieldset>

          </li>
        </g:each>
      </g:if>
      <g:else>
        <li style="border:1px solid #C0C0C0; padding:10px; margin-top:10px; background:#f4f4f4">
        <h2>No Matching Results Found</h2>
        </li>
      </g:else>
      <li><td:displayAd /></li>
    </ul>
  </div>

  </body>
</html>

