class AddDateToLoanformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :loanformularies, :fecha_aceptado_por_as, :date
    add_column :loanformularies, :fecha_aceptado_por_administrativo_obra, :date
    add_column :loanformularies, :fecha_aceptado_por_subgerente_personas, :date
    add_column :loanformularies, :fecha_aceptado_por_jefe_remuneraciones, :date
  end
end
