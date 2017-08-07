class Loanformulary < ApplicationRecord
	belongs_to :lyduser

	validate :input_atributos

	after_save :verificar_estado


def input_atributos

	if rut_solicitante.present? == false

		errors.add(" ", "Complete el campo RUT")


	end

	if obra.present? == false

		errors.add(" ", "Complete el campo obra")


	end

	if monto_solicitado.present? == false

		errors.add(" ", "Complete el campo monto solicitado")

	end

	if monto_aprobado.present? == false

		errors.add(" ", "Complete el campo monto aprobado")


	end

	if numero_cuotas.present? == false

		errors.add(" ", "Complete el campo numero cuotas")


	end

	if motivo_solicitud.present? == false

		errors.add(" ", "Complete el campo motivo solicitud")


	end

	if comentarios.present? == false

		errors.add(" ", "Complete el campo comentarios")


	end


	if monto_solicitado.present? && monto_cuota.present?
		if monto_cuota > monto_solicitado

			errors.add(" ", "El monto de la cuota no puede ser mayor que el monto solicitado")

		end
	end

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
