            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="eventDetails">
              <g:render template="/dashboard/editEvent" model="[tekEventInstance:tekEventInstance]" />
            </div>

