function initMap()
{
	startLocation = new google.maps.LatLng(40.43313,-3.938479);
	
	// Create an array of styles.
    var styles = [ { "stylers": [ { "invert_lightness": true }, { "hue": "#003bff" }, { "gamma": 0.75 }, { "lightness": 42 } ] } ];

	// Create a new StyledMapType object, passing it the array of styles,
    // as well as the name to be displayed on the map type control.
    var styledMap = new google.maps.StyledMapType(styles,
      { name: "Styled Map" });

	// create map
	var mapOptions = {
	  zoom: 6,
	  // mapTypeId: google.maps.MapTypeId.ROADMAP,
	  center: startLocation,
      mapTypeControlOptions: {
        mapTypeIds: []
      },
      backgroundColor: '#595959'
	};
	map = new google.maps.Map(document.getElementById("map"), mapOptions);


    //Associate the styled map with the MapTypeId and set it to display.
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');
}