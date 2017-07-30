class AddEstadoToLoanformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :loanformularies, :estado, :string
    rename_column :loanformularies, :cerado, :cerrado

  end
end
