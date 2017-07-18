class AddCodigoToObras < ActiveRecord::Migration[5.1]
  def change
    add_column :obras, :codigo, :string
  end
end
