class AddTelefonoFromLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :telefono, :integer
  end
end
