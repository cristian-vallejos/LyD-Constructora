class LdController < ApplicationController
	#load_and_authorize_resource

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

	def userspannel
		
		if params[:registrar]

			

			if params[:ld][:id] != ""
				ob = Obra.find(params[:ld][:id]).codigo
			else
				ob = ""
			end

		Lyduser.create(obra: ob,email: params[:ld][:email], password: params[:ld][:password], password_confirmation: params[:ld][:password_confirmation], nombre_usuario: params[:ld][:nombre_usuario], admin_role: 0, asocial_role: params[:ld][:asocial_role], boperativos_role: params[:ld][:boperativos_role], administrativo_obra_role: params[:ld][:administrativo_obra_role], subgerente_personas_role: params[:ld][:subgerente_personas_role], jefe_remuneraciones_role: params[:ld][:jefe_remuneraciones_role])

		elsif params[:cambiarPass]

			if params[:ld][:id] != ""
				us = Lyduser.find(params[:ld][:id])
			else
				us = ""
			end

			us.update_attributes(password: params[:ld][:password])





		elsif params[:cambiarObra]
			
			if params[:ld][:o_id] != ""
				ob = Obra.find(params[:ld][:o_id]).codigo
			else
				ob = ""
			end

			if params[:ld][:u_id] != ""
				us = Lyduser.find(params[:ld][:u_id])
			else
				us = ""
			end

			us.update_attributes(obra: ob)


			

		end
	
	 	 
		
	end

end