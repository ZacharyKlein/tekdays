<h3>Enter Text for Event Homepage</h3>
<g:form name="blurbForm" action="updateBlurb" id="${blurb?.id}">
  <textarea name="content" cols="60" rows="3"
            style="width:100%; height:60px">${blurb?.content}</textarea>
  <p>eventId is ${eventId} and id is ${blurb.id}</p>
  <br/>
  <input type="hidden" name="eventId" value="${eventId}">
  <input type="hidden" name="id" value="${blurb?.id}">
  <input type="submit" value="Update">
</g:form>

