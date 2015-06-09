$(document).pjax('a.organization-link', '#organization-content', {push: true});
$(document).pjax('a.edit-link-pjax', '#organization-content', {push: true});
$(document).pjax('a.update-link-pjax', '#organization-content', {push: true});

$(document).on('submit', '#edit-form form', function(event) {
  $.pjax.submit(event, '#organization-content', {push: false});
});

$('#organization-content').on('pjax:success', function() {
  if (('.org-address').length >= 1 ) {
    displayMap($('.org-address').text());
  }

  $.pjax.reload("#sidebar-pjax-container", {
    url: "/organizations/sidebar",
    push: false,
    replace: false
  });
});


// input form
$(document).on('keyup', '#search', function (){

  var filter = $(this).val();
  var regex  = new RegExp(filter, 'i');

  $('.organization-listing a').each(function (){
    var matches = $(this).text().match(regex);

    // matches
    if (matches !== null){
      $(this).parent().removeClass('hidden');
    }

    // does not match
    else {
      $(this).parent().addClass('hidden');
    }
  });
});
