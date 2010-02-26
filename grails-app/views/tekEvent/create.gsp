<html>
    <head>
        <gui:resources components="['richEditor', 'datePicker', 'autoComplete']" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekDays &rarr; New Event</title>

    </head>
    <body>

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
                       <input type="text" id="name" name="name" style="width:400px" class="editdetail" value="${fieldValue(bean:tekEventInstance,field:'name')}"/><br/>
                       <label class="expl">&nbsp;Name your event...</label>
                    </p>
                    <p>

                    <div style="width:200px; padding-left:10px; margin-bottom:60px">
                        <label for="city" class="editdetail">City:</label>
                        <gui:autoComplete
                            id="city"
                            controller="tekEvent"
                            action="autoCity"
                            forceSelection="true"
                        />
                    </div>
                    <div style="width:200px; padding-left:10px; margin-bottom:60px">
                        <label for="state" class="editdetail">State/Province:</label>
                        <gui:autoComplete
                            id="state"
                            controller="tekEvent"
                            action="autoState"
                            forceSelection="true"
                        />
                    </div>
                    <p>
                        <label for="city" class="editdetail">Country:</label>
                        <input type="text" id="country" name="country" value="${tekEventInstance?.country}"/><br/>
                       <label class="expl">&nbsp;Where will your event be held?</label>
                    </p>

                  <p>
                    <gui:richEditor id="description"
                                    name="description"
                                    height="150px"
                                        width="950px"
                                    dompath="false" />
                                    <script type="text/javascript">
                                        GRAILSUI.description._defaultToolbar.titlebar = 'Description:';
                                    </script>
                  </p>

                    <div style="width:400px; padding-left:10px; margin-bottom:60px">
                        <p>
                            <label for="tagList" class="editdetail">Tags:</label>
                            <gui:autoComplete id="tagList"
                                labelField="name"
                                idField="id"
                                controller="tekEvent"
                                action="autoTags"
                                delimChar=","/>
                         </p>
                    </div>

                    <br />
                </fieldset>
            </div>
        </div>
        <div class="formbuttons">
            <input class="save" type="submit" value="Submit" />
        </div>
        </g:form>

    </body>
</html>

