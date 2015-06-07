$(document).pjax('a.organization-link', '#organization-content', {push: false});
$(document).pjax('a.edit-link-pjax', '#organization-content', {push: false});

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
  });
});
