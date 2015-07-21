$(document).pjax('a.organization-link', '#organization-content', {push: true});
$(document).pjax('a.edit-link-pjax', '#organization-content', {push: true});
$(document).pjax('a.update-link-pjax', '#organization-content', {push: true});

$(document).on('submit', '#edit-form form', function(event) {
  $.pjax.submit(event, '#organization-content', {push: false});
});

$(document).ready(function() {
  if (('.org-address').length >= 1 ) {
    displayMap($('.org-address').text());
  }

  //not set to display none so that the page doesn't jump up
  $('.flash-notice').delay(1000).animate({ opacity: 0 });
  initTextArea();
});

$('#organization-content').on('pjax:success', function() {
  initTextArea();

  if (('.org-address').length >= 1 ) {
    displayMap($('.org-address').text());
  }

  $.pjax.reload("#sidebar-pjax-container", {
    url: "/organizations/sidebar",
    push: false,
    replace: false
  });
});

$(document).on('keyup', '#search', function (){
  var filter = $(this).val();
  var regex  = new RegExp(filter, 'i');

  $('.organization-listing a').each(function (){
    var matches = $(this).text().match(regex);

    if (matches !== null) {
      $(this).parent().removeClass('hidden');
    } else {
      $(this).parent().addClass('hidden');
    }
  });
});

function displayMap(address) {
  var url =
    'https://maps.googleapis.com/maps/api/geocode/json?address=' + address;

  $.ajax({
    url: url,
    dataType: 'json',
    type: 'get',
    success: function(data) {
      var location = data.results[0].geometry.location;
      var position = new google.maps.LatLng(location.lat, location.lng);

      var map = new google.maps.Map(
        document.getElementById('map-canvas'),
        { zoom: 15, center: position }
      );

      google.maps.Marker({ position: position, map: map });
    }
  });
}

//This makes the description field autosize to the size of the text content
var observe;
if (window.attachEvent) {
  observe = function (element, event, handler) {
    element.attachEvent('on'+event, handler);
  };
}
else {
  observe = function (element, event, handler) {
    element.addEventListener(event, handler, false);
  };
}
function initTextArea () {
  var text = document.getElementById('organization_description');
  function resize () {
    text.style.height = 'auto';
    text.style.height = text.scrollHeight+'px';
  }
  /* 0-timeout to get the already changed text */
  function delayedResize () {
    window.setTimeout(resize, 0);
  }
  observe(text, 'change',  resize);
  observe(text, 'cut',     delayedResize);
  observe(text, 'paste',   delayedResize);
  observe(text, 'drop',    delayedResize);
  observe(text, 'keydown', delayedResize);

  text.focus();
  text.select();
  resize();
}
