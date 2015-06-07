$(document).pjax('a.organization-link', '#organization-content', {push: false} );
$(document).pjax('a.edit-link-pjax', '#organization-content', {push: false} );

$(document).on('submit', '#edit-form form', function(event) {
    $.pjax.submit(event, '#organization-content', {push: false});
});

// input form
$('.organization-search input').change(function (){
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