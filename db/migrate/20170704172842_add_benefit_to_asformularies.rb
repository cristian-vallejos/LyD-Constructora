class AddBenefitToAsformularies < ActiveRecord::Migration[5.1]
  def change
    add_reference :asformularies, :benefit, foreign_key: true
  end
end
