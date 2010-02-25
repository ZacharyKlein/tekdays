<html>
    <head>
        <title>TekDays &rarr; Home</title>
	    <meta name="layout" content="main" />

    </head>
    <body>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
              <p>&nbsp;</p>
              <h1>Hi there, unidentified flying object.</h1><br />
              <div style="width:800px;">
              <img align="left" src="http://img.dailymail.co.uk/i/pix/2007/06_03/ufoDM2906_468x327.jpg" height="250" style="padding-right:15;" />
              <p>Sorry we can't address you more personally, but we aren't really certain who you are. Why don't you <a href="${createLink(controller:'login', action:'auth')}">log in</a>?</p>
              </div>
              <br />

            </div>
            <br />
  </body>
</html>

