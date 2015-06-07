$(document).pjax('a.organization-link', '#organization-content', {push: false} );
$(document).pjax('a.edit-link-pjax', '#organization-content', {push: false} );

$(document).on('submit', '#edit-form form', function(event) {
    $.pjax.submit(event, '#organization-content', {push: false});
});