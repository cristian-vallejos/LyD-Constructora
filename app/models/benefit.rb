class Benefit < ApplicationRecord
	has_many :asformularies
	belongs_to :areabenefit
  	has_many :assignbenefits
end
