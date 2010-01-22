<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="search" />
    <title>Tek Event Search Results</title>
  </head>
  <body>

    <div class="body">
            <div id="searchMain" style="border:1px solid #C0C0C0; padding:20px; margin-top:50px; text-align:center">
            <g:form controller="tekEvent" action="search" style="margin: 0; padding: 0">
                <h1 id="Xsearchinstructions" style="">Search for events...</h1>
                <input style="font-size:18pt; background-color:#009999; color:white; margin:10px; width:400px; padding:3px;" id="Xquery" type="text" name="query" />
                <input style="font-size:18pt; background-color:#FF6A00; color:white; margin:10px" id="XsearchButton" type=submit value="Search" />
            </g:form>
        </div>
        <br/>
<!--        <h2>&nbsp; Search Results</h2>-->
        <ul>
            <g:if test="${events}">
                <g:each in="${events}" var="event">
                    <li style="border:1px solid #C0C0C0; padding:10px; margin-top:10px;"><link:eventHome slug="${event?.slug}">${event}</link:eventHome> &nbsp; <b>${event.startDate} - ${event.endDate}</b><br/>
                        <p>${event.description}</p>
                        <p>Tags: ${event.tags}</p>

                    </li>
                </g:each>
            </g:if>
            <g:else>
                <h3>No Matching Results Found</h3>
            </g:else>
        </ul>
    </div>

  </body>
</html>

