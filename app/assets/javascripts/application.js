//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require s3_direct_upload
//= require turbolinks
//= require_tree .

$(document).on('click', '.exhibition-nav', function(){
	$('.exhibition-nav').parent().toggleClass('active');
	$('#works, #artists').toggle();
	return false;
});

$(document).on('click', '.get', function(){
	if($(this).attr("disabled") === "disabled"){
		return false;
	}else {
		$.get($(this).attr("href"), $(this).serialize(), null, "script");
		return false;
	}
});

$(document).on('click', '.exhibition-info', function(){
	var panel = $(this).siblings('.exhibition-images');
	panel.slideToggle().toggleClass('open');
	$('.open').not(panel).slideToggle().toggleClass('open')
	return false;
});

$(document).on('mouseover', '.artist-link', function(){
	var img_class = "." + $(this).attr("id") + '-img'
	$(img_class).animate({'opacity': 1}, 1000);
	
	return false;
});
