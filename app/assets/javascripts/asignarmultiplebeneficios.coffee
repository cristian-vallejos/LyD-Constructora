# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".company_selection").on "change", ->
		$.ajax
			url: "/asignarmultiplebeneficios/get_contacts"
			type: "GET"
			dataType: "script"
			data:
				areabenefit_id: $('.company_selection option:selected').val()


	$(".ccosto_selection").on "change", ->
		$.ajax
			url: "/asignarmultiplebeneficios/get_trabajadorporobra"
			type: "GET"
			dataType: "script"
			data:
				obra_id: $('.ccosto_selection option:selected').val()