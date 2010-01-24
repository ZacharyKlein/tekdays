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
                   <legend>Start a New Event</legend>
                     <p class="explanation">Cool, dude. You want to start an event.</p>
                     <p>
                       <input type="hidden" name="organizer.id" id="organizer.id" value="${loggedInUserInfo(field:'id')}" />
                    </p>
                    <p>
                       <label for="name" class="editdetail">Name:</label>
                       <input type="text" id="name" name="name" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
                       <label class="expl">&nbsp;Name your event...</label>
                    </p>
                    <p>

                    <p>
                        <label for="city" class="editdetail">City:</label>
                        <input type="text" id="city" name="city" value="${tekEventInstance?.city}"/>
                    </p>
                    <p>
                         <label for="state" class="editdetail">State/Province:</label>
                         <input type="text" id="state" name="state" value="${tekEventInstance?.state}"/>
                    </p>
                    <p>
                        <label for="city" class="editdetail">Country:</label>
                        <input type="text" id="country" name="country" value="${tekEventInstance?.country}"/>
                    </p>
                       <label class="expl">&nbsp;Where will your event be held?</label>
                     </p>
                     <p>
                       <label for="description" class="editdetail">Description</label>
                       <textarea id="description" name="description">${tekEventInstance.description}</textarea>
                       <label class="expl">Describe your event...</label>
                     </p>

                    <br />
         </fieldset>
        </div>
        <div class="formbuttons">
            <input class="save" type="submit" value="Submit" />
        </div>
      </g:form>
    </div>
  </body>
</html>

