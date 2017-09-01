class Lyduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :asformularies
	has_many :loanformularies


	def nombre_estado

		if self.is_active
			estado = "ACTIVO"
		else
			estado = "NO ACTIVO"
		end

		"#{nombre_usuario} - #{estado}"

	end



end
