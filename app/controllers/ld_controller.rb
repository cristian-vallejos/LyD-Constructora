class LdController < ApplicationController

	def index

		@asformulary = Asformulary.new(:rut_atendido => params[:rut_atendido])
		
	end
end