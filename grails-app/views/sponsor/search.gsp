<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="sponsorSearch" />
  <gui:resources components="['datePicker', 'autoComplete']" />
  <title>TekDays</title>

	<script type="text/css">

	</script>
  
  </head>
  <body>

  <div class="body">
      <div id="searchMain">

      <g:form controller="sponsor" action="search" style="margin: 0; padding: 0">
        <h1 id="searchinstructions" style="">Search for sponsors...</h1>
        <input style="font-size:18pt; margin:10px; width:400px; padding:3px;" id="query" type="text" name="query" />
  
        <g:actionSubmit style="font-size:18pt; background-color:#000080; color:white; margin:10px" id="searchButton" action="search" value="Search" />
        <br/>
      </g:form>
    </div>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <br/>
<!--    <h2>&nbsp; Search Results</h2>-->
    <ul>
    <li><td:displayAd /></li>
      <g:if test="${sponsors}">
        <g:each in="${sponsors}" var="sponsor">
          <li style="border:1px solid #C0C0C0; padding:10px; margin-top:10px; background:#f4f4f4">
	          <link:showSponsor slug="${sponsor?.slug}"><span style="font-size:16pt">${sponsor}</span></link:showSponsor><br/>

						<img src="${createLink(controller:'sponsor', action:'displayLogo', params:[slug:sponsor.slug])}" class="eventLogo"/>
            <p>${sponsor.description}</p>

	            <fieldset style="background:white;width:400px;">
		            <legend>Tags</legend>
	            <g:set var="tagCount" value="${sponsor.tags.size() - 1}" />
	            <g:each var="t" status="i" in="${sponsor.tags}">
	              <td:linkToSearchSponsorsByTag id="${t?.id}" />
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

