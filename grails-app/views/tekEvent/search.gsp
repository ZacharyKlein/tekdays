<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="search" />
    <gui:resources components="['datePicker', 'accordion']" />
    <title>Tek Event Search Results</title>
  </head>
  <body>

    <div class="body">
            <div id="searchMain" style="border:1px solid #C0C0C0; padding:20px; margin-top:50px; text-align:center">
            <g:form controller="tekEvent" action="search" style="margin: 0; padding: 0">
                <h1 id="Xsearchinstructions" style="">Search for events...</h1>
                <input style="font-size:18pt; background-color:#009999; color:white; margin:10px; width:400px; padding:3px;" id="Xquery" type="text" name="query" />
                <input style="font-size:18pt; background-color:#FF6A00; color:white; margin:10px" id="XsearchButton" type=submit value="Search" />
                <br/>
                <gui:accordion>
                    <gui:accordionElement title="Advanced Search Options">
                        <div id="advSearch" style="text-align:left">
                            <fieldset>
                                <legend>Location</legend>
                                <label for="city" class="editdetail">City:</label>
                                <input type="text" id="city" name="city" value=""/>
                                <label for="state" class="editdetail">State/Province:</label>
                                <input type="text" id="state" name="state" value=""/>
                                <label for="country" class="editdetail">Country:</label>
                                <input type="text" id="country" name="country" value=""/>
                            </fieldset>
                            <fieldset>
                                <legend>Date</legend>
                                <label for="after" class="editdetail">Between:</label>
                                <gui:datePicker name="after" id='after' includeTime="false" formatString="MM/dd/yyyy"/>

                                <label for="before" class="editdetail">and:</label>
                                <gui:datePicker name="before" id='before' includeTime="false" formatString="MM/dd/yyyy"/>
                            </fieldset>
                        </div>
                    </gui:accordionElement>

                </gui:accordion>
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

