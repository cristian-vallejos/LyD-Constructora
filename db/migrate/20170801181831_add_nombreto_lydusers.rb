class AddNombretoLydusers < ActiveRecord::Migration[5.1]
  def change
  	add_column :lydusers, :nombre_usuario, :string
  end
end
