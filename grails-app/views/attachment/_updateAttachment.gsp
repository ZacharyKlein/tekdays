            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="attachmentList">
              <g:render template="/attachment/attachments" model="[attachmentInstanceList:attachmentInstanceList]" />
            </div>

