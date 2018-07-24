// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	// debugger;
	$('#link_expiration_date').datepicker({
  		format: "dd-mm-yyyy",
  		autoclose: true,
  		todayHighlight: true
	});
});
