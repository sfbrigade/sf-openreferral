function displayMap(address) {
    var addressObj = $.get( 'https://maps.googleapis.com/maps/api/geocode/json?address='+address);

    var the_url = 'https://maps.googleapis.com/maps/api/geocode/json?address='+address

    $.ajax({
        url: the_url,
        dataType: 'json',
        type: 'get',
        success: function(data) {
            lat = data.results[0].geometry.location.lat;
            lng = data.results[0].geometry.location.lng;

            if(lat!=null && lng!= null){
                var myLatlng = new google.maps.LatLng(lat,lng);
            }

            var mapOptions = {
                zoom: 15,
                center: myLatlng
            }
            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map
            });
        }
    });
}

