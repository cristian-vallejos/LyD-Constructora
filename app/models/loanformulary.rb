class Loanformulary < ApplicationRecord
	belongs_to :lyduser

	validate :input_atributos

	after_save :verificar_estado

	after_create :crear_log_loan


has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


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


	if monto_solicitado.present? && monto_aprobado.present?
		if monto_aprobado > monto_solicitado

			errors.add(" ", "El monto aprobado no puede ser mayor que el monto solicitado")

		end
	end

	if monto_cuota.present? && monto_aprobado.present? && numero_cuotas.present?
		if monto_cuota*numero_cuotas > monto_aprobado

			errors.add(" ", "La suma de las cuotas no puede ser mayor que el monto aprobado")

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



def crear_log_loan
log = Logloan.new(



	rut_solicitante: self.rut_solicitante,
    nombre_solicitante: self.nombre_solicitante,
    obra: self.obra,
    cargo: self.cargo,
    monto_solicitado: self.monto_solicitado,
    numero_cuotas: self.numero_cuotas,
    motivo_solicitud: self.motivo_solicitud,
    comentarios: self.comentarios,
    estado: self.estado)

log.save!

end



	
end
