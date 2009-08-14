<html>
  <head>
    <title>TekDays - The Community is the Conference!</title>
	  <meta name="layout" content="main" />
  </head>
  <body>
  
        <div id="indexBlurb">
    <!-- START:volunteerList -->
    <!-- START:search -->
          <h3>Welcome to TekDays.com</h3> 
          <p>TekDays.com is a site dedicated to assisting individuals and communities 
             to organize technology conferences.  To bring great minds with common 
             interests and passions together for the good of greater geekdom!  
          </p>
        </div>
        
        <div id="loginBlurb">
    <!-- START:volunteerList -->
    <!-- START:search -->
          <h3>Register Now!</h3> 
          <p>Here's some real good reasons why you should register. First of all, this site is useless unitl lots of folks like you decide to join. 
              And until this site is useful, we won't be able to get much advertising. And unless we get lots of advertising, we won't be able to afford
              to run the site. See? So join today! We'll save a polar bear for you...
          </p>
        </div>
    <!-- END:volunteerList -->
    <!-- START_HIGHLIGHT -->
        <div id="indexSearch">
          <g:form controller="tekEvent" action="search">
            <label style="font-weight:bold; color:#37CFBB;">Search:</label>
            <input style=" background-color:#37CFBB; color:white;" id="query" type="text" name="query" />
            <input type=submit value="Go" />
          </g:form>
        </div>
        <br/>
    <!-- END_HIGHLIGHT -->
    <!-- END:search -->
    <!-- START:volunteerList -->
        <g:organizerEvents />
    <!-- START_HIGHLIGHT -->
        <g:volunteerEvents />
    <!-- END_HIGHLIGHT -->
    <!-- END:volunteerList -->
        <div class="indexCell">
          <h3>Find a Tek Event</h3>
          <p>
            See if there's a technical event in the works that strikes your fancy.
            If there is, you can volunteer to help or just let the organizers know 
            that you'd be interested in attending.  Everybody has a role to play.
          </p>
            <span class="buttons">
              <g:link controller="tekEvent" action="list">Find a Tek Event</g:link>
            </span>
        </div>
        <div class="indexCell">
          <h3>Organize a Tek Event</h3>
          <p>
            If you don't see anything that suits your interest and location, then 
            why not get the ball rolling.  It's easy to get started and there may 
            be others out there ready to get behind you to make it happen.
          </p>
            <span class="buttons">
              <g:link controller="tekEvent" action="create">
                Organize a Tek Event
              </g:link>
            </span>

            </div>   
       

        <div class="indexCell">
          <h3>Sponsor a Tek Event</h3>
          <p>
            If you are part of a business or organization that is involved in 
            technology then sponsoring a tek event would be a great way to let the 
            community know that you're there and you're involved. 
          </p>

            <span class="buttons">
              <g:link controller="sponsor" action="create">
                Sponsor a Tek Event
              </g:link>
            </span>
        </div>

  </body>
</html>
