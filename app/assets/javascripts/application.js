//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require s3_direct_upload
//= require turbolinks
//= require_tree .

function centerSlides() {
	
	var gallery_height = $(window).height() - 50,
		height = Math.ceil( gallery_height * .8),
		width = Math.ceil($('#gallery').width() * .8);
		
	$(".slide img").each(function() {
		$(this).css({
			"max-height": height + 'px',
			"max-width": width + 'px',
			"height": "auto",
			"width": "auto",
		});
		
		var top = Math.ceil( (gallery_height - $(this).height()) / 2 ) - 5;

		$(this).css("margin-top", top + "px");

	});
	
	$("#gallery-slides .slide").css("width", $("#gallery").width() + "px");
}

$(window).resize(function(){
	centerSlides();
});


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

$(document).on('click', '.exhibition-info.toggleable', function(){
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

$(document).on('click', '.artist-exhibitions-link', function(){
	$('#artist-exhibitions').toggle();
	return false;
});

$(document).on('ajax:before', 'form', function(event, xhr, settings) {
	$(this).
		attr("disabled", "disabled").
		addClass("disabled").
		addClass("working");
	
	$('#modal-form').addClass("working");
			
});

$(document).on('ajax:complete', 'form', function(event, xhr, settings) {
	$(this).
		removeAttr("disabled").
		removeClass("disabled").
		removeClass("working");
	
	$("#modal-form").removeClass("working");
});