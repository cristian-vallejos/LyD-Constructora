class Changecolumn4 < ActiveRecord::Migration[5.1]
  def change
  	change_column :loanformularies, :aceptado_por_as, :boolean, default: true

  end
end
