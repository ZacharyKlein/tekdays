

<html>
    <head>
        <gui:resources components="['richEditor', 'datePicker', 'accordion', 'autoComplete']" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="event" />
        <title>TekDays  &rarr; Edit Event Details</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Details</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekEventInstance}">
                <div class="errors">
                    <g:renderErrors bean="${tekEventInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" action="update" enctype="multipart/form-data">
                <input type="hidden" name="version" value="${tekEventInstance?.version}" />
                <div class="dialog">
                    <fieldset>
                        <legend>Required Info</legend>
                        <p>
                            <label for="name" class="editdetail">Name:</label>
                            <input type="text" id="name" name="name" value="${tekEventInstance?.name}"/>
                        </p>
                        <div style="width:200px; padding-left:10px; margin-bottom:60px">
                            <label for="city" class="editdetail">City:</label>
                            <gui:autoComplete
                                id="city"
                                controller="tekEvent"
                                action="autoCity"
                                value="${tekEventInstance?.city}"
                            />
                        </div>
                        <div style="width:200px; padding-left:10px; margin-bottom:60px">
                            <label for="state" class="editdetail">State/Province:</label>
                            <gui:autoComplete
                                id="state"
                                controller="tekEvent"
                                action="autoState"
                            />
                        </div>
                        <p>
                            <label for="city" class="editdetail">Country:</label>
                            <input type="text" id="country" name="country" value="${tekEventInstance?.country}"/>
                        </p>

                        <p>
                            <gui:richEditor id="description"
                                            name="description"
                                            height="150px"
                                            width="950px"
                                            dompath="false"
                                            value="${tekEventInstance?.description}" />
                            <script type="text/javascript">
                                GRAILSUI.description._defaultToolbar.titlebar = 'Description:';
                            </script>
                        </p>

                        <p>
                            <input type="hidden" name="organizer.id" id="organizer.id" value="${tekEventInstance?.organizer?.id}" />
                        </p>
                    </fieldset>
                    <gui:accordion>
                        <gui:accordionElement title="Extra Details">
                            <fieldset>
                                <legend>Many and Varied Miscellaneous Details</legend>

                                <p>
                                    <label for="venue" class="editdetail">Venue:</label>
                                    <input type="text" id="venue" name="venue" value="${tekEventInstance?.venue}"/>
                                </p>
                                <p>
                                    <label for="startDate" class="editdetail">Start Date:</label>
                                    <gui:datePicker name="startDate" id='startDate' value="${tekEventInstance?.startDate}" includeTime="false" formatString="MM/dd/yyyy"/>
                                </p>
                                <p>
                                    <label for="endDate" class="editdetail">End Date:</label>
                                    <gui:datePicker name="endDate" id='endDate' value="${tekEventInstance?.endDate}" includeTime="false" formatString="MM/dd/yyyy"/>
                                </p>
                                <p>

                                <p>
                                    <label for="scheduleFile">
                                        <g:message code="tekEvent.schedule.label" default="Schedule" />
                                    </label><br/>
                                    <input type="file" id="scheduleFile" name="scheduleFile" /><br/>
                                    <p>(Optional) Upload an Event schedule</p>
                                </p>


                                <p>
                                    <label for="logoFile">
                                        <g:message code="tekEvent.logo.label" default="Logo" />
                                    </label><br/>
                                    <input type="file" id="logoFile" name="logoFile" /><br/>
                                    <p>(Optional) Logo will be displayed at 120x120 pixels</p>
                                </p>

                                <p>
                                    <label for="banner">
                                        <g:message code="tekEvent.banner.label" default="Banner" />
                                    </label><br/>
                                    <input type="file" id="banner" name="banner" /><br/>
                                    <p>(Optional) Banner will be displayed at 120x1000 pixels</p>
                                </p>

                                <div class="tagsDiv">
                                    <p>
                                        <label for="tagList" class="editdetail">Tags:</label>
                                        <gui:autoComplete id="tagList" resultName="tagList" width="500px" labelField="name" idField="id" controller="tekEvent" action="autoTags" delimChar=","/>
                                     </p>
                                </div>
                            </fieldset>
                        </gui:accordionElement>
                    </gui:accordion>
                </div>
                <div class="formbuttons">
                    <input type="hidden" name="id" value="${tekEventInstance?.id}" />
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

