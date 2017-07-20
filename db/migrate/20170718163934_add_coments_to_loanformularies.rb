class AddComentsToLoanformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :loanformularies, :comentario_as, :text
    add_column :loanformularies, :comentario_administrativo_obra, :text
    add_column :loanformularies, :comentario_subgerente_personas, :text
    add_column :loanformularies, :comentario_jefe_remuneraciones, :text
  end
end
