class Changecolumn3 < ActiveRecord::Migration[5.1]
  def change
  	change_column :asformularies, :codigo_obra, :string
  	change_column :lydusers, :obra, :string
  	change_column :loanformularies, :obra, :string
  	change_column :logas, :codigo_obra, :string

  end
end
