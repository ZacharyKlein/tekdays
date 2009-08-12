<html>
  <head>
    <gui:resources components="['richEditor', 'datePicker']" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>TekDays &rarr; New Event</title>         
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <a class="home" href="${resource(dir:'')}">Home</a>
      </span>
      <span class="menuButton">
        <g:link class="list" action="list">All Events</g:link>
      </span>
    </div>
    <div class="body">
      <h1>Organize a new event</h1><p>&nbsp;</p>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${tekEventInstance}">
        <div class="errors">
          <g:renderErrors bean="${tekEventInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <p>
              <label for="name">Name:</label>
              <input type="text" 
                         id="name" 
                         name="name"
                         value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
          </p><br />
          <p>
              <label for="city">City:</label>
              <input type="text" 
                         id="city" 
                         name="city" 
                         value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
          </p><br />
          <p>
              <label for="description">Description:</label><br /><br />
              <gui:richEditor 
                  id="description"
                  name="description"
                  value="${tekEventInstance.description}"
                  height="200"
                  width="100%"
              />
          </p><br />
          <p>
              <label for="organizer">Organizer:</label>
              //TODO: replace this whole block with hidden field. The organizer will be the TekUser who came to this page by default. You shouldn't be able to choose who it is
              <g:select optionKey="id" from="${TekUser.list()}" name="organizer.id" value="${tekEventInstance?.organizer?.id}" ></g:select>
          </p>
          <p>
              <label for="venue">Venue:</label>
              <input type="text" 
                         id="venue" 
                         name="venue" 
                         value="${fieldValue(bean:tekEventInstance,field:'venue')}"/>
          </p><br />
          <p>
              <label for="startDate">Start Date:</label>
              <gui:datePicker id="startDate" /><br />
          <p>
              <label for="endDate">End Date:</label>
              <g:datePicker name="endDate" precision="day"
                                value="${tekEventInstance?.endDate}" >
              </g:datePicker>
          </p><br />
          <p>
              <label for="twitterId">Twitter Id / Nickname:</label>
              <input type="text" 
                  id="twitterId" 
                  name="twitterId" 
                  value="${fieldValue(bean:tekEventInstance,field:'twitterId')}"/>
          </p><br />
          <p>
              <label for="twitterPassword">Twitter Password:</label>
              <input type="password" 
                  id="twitterPassword" 
                  name="twitterPassword" 
                  value="${fieldValue(bean:tekEventInstance,field:'twitterPassword')}"/>
          </p><br />
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Create" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
