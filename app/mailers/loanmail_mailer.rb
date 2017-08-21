class LoanmailMailer < ApplicationMailer
	default from: 'noreply.personas@gmail.com'

	def correo(destino)

		mail to: destino, subject: "Nueva Solicitud de Préstamo"

	end

end
