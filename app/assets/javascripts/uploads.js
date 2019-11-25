$(document).on('turbolinks:load', function() {
	$('#upload_tag_list').tagsInput({
		'height': 'auto',
		'width': 'auto'
	});

	$(".toggleTagEdit").click(function() {
		$(".edit_upload").toggleClass("active");
	});

	$(".multiContainer").hover(function() {
		let uploadId = $(this).attr("upload_id");
		$(`.multiContainer[upload_id=${uploadId}]`).closest(".fileContainer").toggleClass("active");
	});

	$(document).keydown(function() {
		let keyCode = event.keyCode;
		if (keyCode === 192) {
			$(".sidebar").toggleClass("inactive");
		}
	});

	$(".sidebarToggle").click(function() {
		$(".sidebar").toggleClass("inactive");
	});

	$(".hamburger").click(function() {
		$(this).toggleClass("is-active");
		$(".navbarMobileLinks").slideToggle("fast");
	});
});

function copyToClipboard(text){
    var dummy = document.createElement("input");
    document.body.appendChild(dummy);
    dummy.setAttribute('value', text);
    dummy.select();
    document.execCommand("copy");
    document.body.removeChild(dummy);
}