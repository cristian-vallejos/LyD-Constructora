class AddCodigoToLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :codigo, :integer
  end
end
