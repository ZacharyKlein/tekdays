<html>
    <head>
        <gui:resources components="['richEditor', 'datePicker']" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Event</title>
        <style type="text/css" media="screen">
        body {
          font-size: 12pt;
        }

        label.editdetail {
          display: block;
          font-size:1em;
          font-weight:bold;
        }

        input.editdetail {
          width: 300px;
          font-size: 1.4em;
          font-weight:normal;
        }
        </style>
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
              <fieldset>
                   <legend>Organize a New Event</legend>
                     <p class="explanation">Required fields are marked with *.</p>
                     <p>
                       <label for="name" class="editdetail">* Name:</label>
                       <input type="text" id="name" name="name" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
                     </p>
                     <p>
                       <label for="city" class="editdetail">* City:</label>
                       <input type="text" id="city" name="city" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
                     </p>
                     <p>
                       <gui:richEditor 
                            id="description"
                            name="description"
                            value="${tekEventInstance.description}"
                            height="200"
                            width="100%"
                            titlebar="Description"
                            dompath="false"
                        />
                        <script  type="text/javascript">
                            GRAILSUI.description._defaultToolbar.titlebar = '* Description:';
                        </script>
                     </p>
                    <!--<p>
                        <label for="name">Name:</label>
                        <input type="text" 
                            id="name" 
                            name="name"
                            value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
                    </p>
                    <br />
                    <p>
                        <label for="city">City:</label>
                        <input type="text" 
                            id="city" 
                            name="city" 
                            value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
                    </p>
                    <br />
                    <p>
                        <label for="description">Description:</label><br /><br />
                        <gui:richEditor 
                            id="description"
                            name="description"
                            value="${tekEventInstance.description}"
                            height="200"
                            width="100%"
                        />
                    </p>-->
                    <br />
                    <p>
                       <input type="hidden" name="organizer.id" id="organizer.id" value="${loggedInUserInfo(field:'id')}" />
                    </p>
                    <p>
                        <label for="venue" class="editdetail">Venue:</label>
                        <input type="text" 
                            id="venue" 
                            name="venue" 
                            class="editdetail"
                            value="${fieldValue(bean:tekEventInstance,field:'venue')}"/>
                    </p>
                    <br />
                    <p>
                        <label for="venueMapLink" class="editdetail">Google Maps URL for Venue:</label>
                        <input type="text" 
                            id="venueMapLink" 
                            name="venueMapLink" 
                            class="editdetail"
                            value="${fieldValue(bean:tekEventInstance,field:'venueMapLink')}"/>
                    </p>
                    <br />    
                    <p>
                        <label for="startDate" class="editdetail">Start Date:</label>
                        <gui:datePicker name="startDate" id='startDate' value="${tekEventInstance?.startDate}" includeTime="false"/>

                    <p>
                        <label for="endDate" class="editdetail">End Date:</label>
                        <g:datePicker name="endDate" precision="day"
                            value="${tekEventInstance?.endDate}" >
                        </g:datePicker>
          </p><br />
          <p>
              <label for="twitterId" class="editdetail">Twitter Id / Nickname:</label>
              <input type="text" 
                  id="twitterId" 
                  name="twitterId" 
                  class="editdetail"
                  value="${fieldValue(bean:tekEventInstance,field:'twitterId')}"/>
          </p><br />
          <p>
              <label for="twitterPassword" class="editdetail">Twitter Password:</label>
              <input type="password" 
                  id="twitterPassword" 
                  name="twitterPassword" 
                  class="editdetail"
                  value="${fieldValue(bean:tekEventInstance,field:'twitterPassword')}"/>
          </p><br />

          <p>
              <label for="tag.name">
                <g:message code="tag.name.label" default="Tags" />
              </label>
              <input type="text" id="tag.name" name="tag.name" value=""/>
          </p> 

         </fieldset><br />
        </div>
        <div class="formbuttons">
            <input class="save" type="submit" value="Create" />
        </div>
      </g:form>
    </div>
  </body>
</html>
