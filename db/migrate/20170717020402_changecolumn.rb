class Changecolumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :asformularies, :numero_atencion, :integer, default: 1
  end
end
