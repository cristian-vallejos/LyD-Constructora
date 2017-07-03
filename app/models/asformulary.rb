class Asformulary < ApplicationRecord
  belongs_to :user
  belongs_to :aspcategory
  has_many :epcformularies, :dependent => :destroy 
end
