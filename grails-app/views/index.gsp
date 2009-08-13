<html>
  <head>
    <title>TekDays - The Community is the Conference!</title>
	  <meta name="layout" content="main" />
  </head>
  <body>
    <div style="margin-left:25px; margin-top:25px; width:85%">
<!-- START:volunteerList -->
<!-- START:search -->
      <h3>Welcome to TekDays.com</h3> 
      <p>TekDays.com is a site dedicated to assisting individuals and communities 
         to organize technology conferences.  To bring great minds with common 
         interests and passions together for the good of greater geekdom!  
      </p>
    </div>
<!-- END:volunteerList -->
<!-- START_HIGHLIGHT -->
    <div style="margin-left:30%; margin-top:25px; width:40%">
      <g:form controller="tekEvent" action="search">
        <label style="font-weight:bold">Search:</label>
        <input id="query" type="text" name="query" />
        <input type=submit value="Go" />
      </g:form>
    </div>
<!-- END_HIGHLIGHT -->
<!-- END:search -->
<!-- START:volunteerList -->
    <g:organizerEvents />
<!-- START_HIGHLIGHT -->
    <g:volunteerEvents />
<!-- END_HIGHLIGHT -->
<!-- END:volunteerList -->
    
    <div class="indexCell">
       <h3>Sponsor a Tek Event</h3>
       <p>
         If you are part of a business or organization that is involved in 
         technology then sponsoring a tek event would be a great way to let the 
         community know that you're there and you're involved. 
       </p>

    </div>
    <div style="margin-left:25px; margin-top:25px; width:85%">
      <h3>Sponsor a Tek Event</h3>
      <p>
        If you are part of a business or organization that is involved in 
        technology then sponsoring a tek event would be a great way to let the 
        community know that you're there and you're involved. 
      </p>
        <span class="buttons" style="float:right;margin-right:30px">
          <g:link controller="sponsor" action="create">
            Sponsor a Tek Event
          </g:link>
        </span>
    </div>

</div>

  </body>
</html>
