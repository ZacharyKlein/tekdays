<html>
    <head>
        <title>TekDays &rarr; Send Feedback</title>
	    <meta name="layout" content="main" />

    </head>
    <body>
    <g:isNotLoggedIn>
      <div class="logo">
        <a href="${request.contextPath}/">
          <img src="${resource(dir:'images',file:'td_logo_small.png')}" alt="TekDays"/>
        </a>
      </div><br />
    </g:isNotLoggedIn>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        <br/>
        <g:form controller="admin" action="leaveFeedback" method="post" >
        <fieldset>
          <legend>Send Feedback</legend>
          <p>Type your message in the field below.</p>
          <g:isNotLoggedIn>
            <p>
               <label for="name" class="editdetail">Name:</label>
              <input type="text" id="name" name="name" class="editdetail" value="Your name goes here." />
            </p>
            <p>
              <label for="email" class="editdetail">Email:</label>
              <input type="text" id="email" name="email" class="editdetail" value="Type your email address." />
            </p>
          </g:isNotLoggedIn>
          <p>
            <label for="message" class="editdetail">Message:</label>
            <textarea id="message" name="message" class="editdetail"></textarea>
          </p>
          <g:actionSubmit controller="admin" action="leaveFeedback" value="Send" />
        </fieldset>
        </g:form>
  </body>
</html>

