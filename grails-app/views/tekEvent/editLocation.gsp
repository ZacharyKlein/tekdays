

<html>
  <head>
    <gui:resources components="['richEditor', 'datePicker', 'accordion', 'autoComplete']" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="dashboard" />
    <meta name="dashTab" content="editLocation" />
    <title>TekDays  &rarr; Edit Event Details</title>
		<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true_or_false&amp;key=ABQIAAAAXeAx6Va9xJMTHMkJ3KHQXBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxT-UirBlgedQ5BoYGxWIWaEyBU3CQ" type="text/javascript"></script>

    <script type="text/javascript">
	    var map = null;
	    var geocoder = null;
			function initialize() {

			  if (GBrowserIsCompatible()) {

			    map = new GMap2(document.getElementById("map"));
			    map.setCenter(new GLatLng(37.4419, -122.1419), 13);

					map.addControl(new GLargeMapControl());
					map.addControl(new GMapTypeControl());

			    geocoder = new GClientGeocoder();
			  }
			}


	    function showAddress(address) {
	      if (geocoder) {
	        geocoder.getLatLng(
	          address,
	          function(point) {
	            if (!point) {
	              alert(address + " not found");
	            } else {
	              map.setCenter(point, 13);
	              var marker = new GMarker(point);
	              map.addOverlay(marker);
	              marker.openInfoWindowHtml(address);
	            }
	          }
	        );
	      }
	    }
    </script>
    
  </head>
  <body onload="initialize()">
    <div class="nav">
	    <span>Edit Details</span>
    </div>
    <div>
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

          <input type="hidden" name="organizer.id" id="organizer.id" value="${tekEventInstance?.organizer?.id}" />

          <fieldset>
	          
            <legend>Location</legend>
            <div style="float:left">
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
	                <label for="venue" class="editdetail">Venue:</label>
	                <input type="text" id="venue" name="venue" value="${tekEventInstance?.venue}"/>
	            </p>
						</div>
			    </g:form>
					<div style="float:right;">
						<form action="#" onsubmit="showAddress(this.address.value); return false">
						<div id="map" style="width: 450px; height: 400px; "></div>
			      <p>
			        <input type="text" size="30" name="address" value="1600 Amphitheatre Pky, Mountain View, CA" />
			        <input type="submit" value="Find Address" />
			      </p>
			    </form>
					</div>
				</fieldset>
		</div>
    </div>
  </body>
</html>

