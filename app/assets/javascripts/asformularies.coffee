# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".areabenefit_selection").on "change", ->
		$.ajax
			url: "/asformularies/get_benefits"
			type: "GET"
			dataType: "script"
			data:
				areabenefit_id: $('.areabenefit_selection option:selected').val()
