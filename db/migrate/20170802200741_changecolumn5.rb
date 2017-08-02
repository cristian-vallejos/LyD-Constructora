class Changecolumn5 < ActiveRecord::Migration[5.1]
  def change
  	change_column :loanformularies, :estado, :string, default: "en proceso"

  end
end
