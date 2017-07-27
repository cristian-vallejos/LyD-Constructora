class Changecolumn2 < ActiveRecord::Migration[5.1]
  def change
  	change_column :asformularies, :rut_atendido, :string
  end
end
