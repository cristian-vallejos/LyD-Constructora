class AddCodigoEpcFromLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :codigo_epc, :integer
  end
end
