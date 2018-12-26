$(document).ready(function() {
	$('.leapyear-algorithmic').persianDatepicker({
		inline: true,
		onSelect: function(unix){
			console.log('datepicker select : ' + unix);
		}
	});
});
