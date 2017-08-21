class Obra < ApplicationRecord
	has_many :assignbenefits

	def nombre_codigo

		"#{codigo} - #{nombre}"

	end

end
