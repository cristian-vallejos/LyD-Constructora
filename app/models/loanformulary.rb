class Loanformulary < ApplicationRecord
	belongs_to :lyduser

	validate :input_atributos

	after_save :verificar_estado


def input_atributos

	if rut_solicitante.present? == false

		errors.add(" ", "Falta RUT")


	end

	if obra.present? == false

		errors.add(" ", "Ingrese una obra")


	end

	#if monto_cuota > monto_solicitado

	#	errors.add(" ", "El monto de la cuota no puede ser mayor que el monto solicitado")

	#end

end


def verificar_estado
	if aceptado_por_as == false || aceptado_por_administrativo_obra == false || aceptado_por_subgerente_personas == false || aceptado_por_jefe_remuneraciones == false
		cerrado = true
		estado = "rechazado"
	elsif aceptado_por_as == true || aceptado_por_administrativo_obra == true || aceptado_por_subgerente_personas == true || aceptado_por_jefe_remuneraciones == true
		cerrado = true
		estado = "aceptado"
	else
		estado = "en proceso"
	end
end


	
end
