class LdController < ApplicationController

	def index

		@asformulary = Asformulary.new(:rut_atendido => params[:rut_atendido])
		
	end


	def crudpannel
	end

	def beneficiospannel
	end

	def reportspannel

		@obra = Obra.new
		@asformulary = Asformulary.new

		#puts params[:obra][:id]
	end



end