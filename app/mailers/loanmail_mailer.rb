class LoanmailMailer < ApplicationMailer
	default from: 'r.neutral09@gmail.com'

	def correo(destino)

		mail to: destino, subject: "Nueva Solicitud de Préstamo"

	end

end
