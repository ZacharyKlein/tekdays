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
    <div style="margin-left:25px; margin-top:25px; width:85%">
      <h3>Find a Tek Event</h3>
      <p>
        See if there's a technical event in the works that strikes your fancy.
        If there is, you can volunteer to help or just let the organizers know 
        that you'd be interested in attending.  Everybody has a role to play.
      </p>
        <span class="buttons" style="float:right;margin-right:30px">
          <g:link controller="tekEvent" action="list">Find a Tek Event</g:link>
        </span>
    </div>
    <div style="margin-left:25px; margin-top:25px; width:85%">
      <h3>Organize a Tek Event</h3>
      <p>
        If you don't see anything that suits your interest and location, then 
        why not get the ball rolling.  It's easy to get started and there may 
        be others out there ready to get behind you to make it happen.
      </p>
        <span class="buttons" style="float:right;margin-right:30px">
          <g:link controller="tekEvent" action="create">
            Organize a Tek Event
          </g:link>
        </span>
<<<<<<< HEAD:grails-app/views/index.gsp
        </div>   
   
    
    
    <div class="indexCell">
       <h3>Sponsor a Tek Event</h3>
       <p>
         If you are part of a business or organization that is involved in 
         technology then sponsoring a tek event would be a great way to let the 
         community know that you're there and you're involved. 
       </p>
=======
    </div>
    <div style="margin-left:25px; margin-top:25px; width:85%">
      <h3>Sponsor a Tek Event</h3>
      <p>
        If you are part of a business or organization that is involved in 
        technology then sponsoring a tek event would be a great way to let the 
        community know that you're there and you're involved. 
      </p>
>>>>>>> 96406e425eed500d4d8edb5adc37d12a6e8754cf:grails-app/views/index.gsp
        <span class="buttons" style="float:right;margin-right:30px">
          <g:link controller="sponsor" action="create">
            Sponsor a Tek Event
          </g:link>
        </span>
    </div>
<<<<<<< HEAD:grails-app/views/index.gsp
</div>
=======
>>>>>>> 96406e425eed500d4d8edb5adc37d12a6e8754cf:grails-app/views/index.gsp
  </body>
</html>
