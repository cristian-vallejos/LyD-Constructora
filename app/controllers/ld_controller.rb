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
		@benefitslog = Logbenefitsfinal.where(ruttrabajador: params[:asformulary][:rut_atendido]).order('created_at DESC')

		#puts params[:obra][:id]
	end

	def userspannel
		
		if params[:registrar]

			

			if params[:ld][:id] != ""
				ob = Obra.find(params[:ld][:id]).codigo
			else
				ob = ""
			end



			asocial_role = false
			ao_role = false
			administrativo_obra_role = false
			subgerente_personas_role = false
			jefe_remuneraciones_role = false


			if params[:ld][:role] == "asocial_role"
				asocial_role = true
			elsif params[:ld][:role] == "ao_role"
				ao_role = true
			elsif params[:ld][:role] == "administrativo_obra_role"
				administrativo_obra_role = true
			elsif params[:ld][:role] == "subgerente_personas_role"
				subgerente_personas_role = true
			elsif params[:ld][:role] == "jefe_remuneraciones_role"
				jefe_remuneraciones_role = true		
			end



		Lyduser.create(obra: ob,email: params[:ld][:email], password: params[:ld][:password], password_confirmation: params[:ld][:password_confirmation], nombre_usuario: params[:ld][:nombre_usuario], admin_role: 0, asocial_role: asocial_role, ao_role: ao_role, administrativo_obra_role: administrativo_obra_role, subgerente_personas_role: subgerente_personas_role, jefe_remuneraciones_role: jefe_remuneraciones_role)
		redirect_to ld_userspannel_path

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




		elsif params[:desactivarUsuario]

			if params[:ld][:id] && current_lyduser.admin_role?

				us = Lyduser.find(params[:ld][:id])

				if us.is_active?
					us.update_attributes(is_active: false)
				else
					us.update_attributes(is_active: true)
				end


			end


			


			

		end
	
	 	 
		
	end

end