class Asignarmultiplebeneficio < ApplicationRecord
  belongs_to :employee
  belongs_to :obra
  belongs_to :areabenefit
  belongs_to :benefit
end
