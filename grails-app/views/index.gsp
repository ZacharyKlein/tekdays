<html>
  <head>
    <title>TekDays &rarr; The Community is the Conference!</title>
	  <meta name="layout" content="main" />
  </head>
  <body>
        <div id="indexBlurb">
    <!-- START:volunteerList -->
    <!-- START:search -->
          <p id="intro">Helping <strong>individuals and communities</strong> 
              organize <br/>cutting edge technology conferences<br/>
	      <span id="sub">bringing great minds with common 
                interests and passions together for the good of greater geekdom!  
	       </span>
	  </p>
        </div>
        
    <!--    <div id="loginBlurb">
          <h3>Register Now!</h3> 
          <p>Here's some real good reasons why you should register. First of all, this site is useless unitl lots of folks like you decide to join. 
              And until this site is useful, we won't be able to get much advertising. And unless we get lots of advertising, we won't be able to afford
              to run the site. See? So join today! We'll save a polar bear for you...
          </p>
        </div>-->

        <div id="indexSearch">
          <g:form controller="tekEvent" action="search">
            <label>Search:</label>
            <input id="query" type="text" name="query" />
            <input class="searchButton" type=submit value="Go" />
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
          <div class="box-outer">
            <div class="box-inner">
              <h3>Find an Event on TekDays</h3>
              <p>
                See if there's a technical event in the works that strikes your fancy; 
                if there is, you can volunteer to help, or just let the organizers know 
                that you'd be interested in attending.  Everybody has a role to play.
              </p>
                <span class="buttons">
                  <g:link controller="tekEvent" action="list">Find an Event</g:link>
                </span>
              </div>
          </div>   
        </div>
        
        <div class="indexCell">
          <div class="box-outer">
            <div class="box-inner">
              <h3>Organize an Event with TekDays</h3>
              <p>
                If you don't see anything that suits your interest and location, 
                why not get the ball rolling?  It's easy to get started, and there may 
                be others out there ready to get behind you to make it happen.
              </p>
                <span class="buttons">
                  <g:link controller="tekEvent" action="create">
                    Organize an Event
                  </g:link>
                </span>
               </div>
             </div>
            </div>   
       

        <div class="indexCell">
          <div class="box-outer">
            <div class="box-inner">
              <h3>Sponsor an Event on TekDays</h3>
              <p>
                If you're part of a business or organization that is involved in 
                technology, sponsoring an event on TekDays is a great way to let the 
                community know that you're there and you're involved. 
              </p>

                <span class="buttons">
                  <g:link controller="sponsor" action="create">
                    Sponsor an Event
                  </g:link>
                </span>
           </div>
         </div>
        </div>

  </body>
</html>
