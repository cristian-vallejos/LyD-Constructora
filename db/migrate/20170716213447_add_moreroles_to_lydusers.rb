class AddMorerolesToLydusers < ActiveRecord::Migration[5.1]
  def change
    add_column :lydusers, :administrativo_obra_role, :boolean, default: false
    add_column :lydusers, :subgerente_personas_role, :boolean, default: false
    add_column :lydusers, :jefe_remuneraciones_role, :boolean, default: false
    add_column :lydusers, :obra, :integer
  end
end
