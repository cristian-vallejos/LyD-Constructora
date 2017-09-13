class ChangeLogas < ActiveRecord::Migration[5.1]
  def change
  	change_column :logas, :telefono, :string
  	remove_column :logas, :comentarios_caso, :string
	remove_column :logas, :caso_amerita_epc, :boolean
	remove_column :logas, :derivar_a, :string
	remove_column :logas, :fecha_as, :datetime
	remove_column :logas, :fecha_epc, :datetime
	remove_column :logas, :codigo, :integer
	remove_column :logas, :epcformulary_id, :integer
	remove_column :logas, :rut_atendido_epc, :integer
	remove_column :logas, :codigo_epc, :integer
	remove_column :logas, :beneficio, :string

  end
end
