class AddAtributesToBenefits < ActiveRecord::Migration[5.1]
  def change
  	add_column :benefits, :familia, :boolean, default: false
  	add_column :benefits, :asistencia, :boolean, default: false
  	add_reference :benefits, :areabenefit, foreign_key: true
  end
end
