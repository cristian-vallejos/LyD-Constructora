class AddRutAtendidoEpcFromLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :rut_atendido_epc, :integer
  end
end
