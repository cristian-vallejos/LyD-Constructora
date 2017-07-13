class AddRolesToLydusers < ActiveRecord::Migration[5.1]
  def change
    add_column :lydusers, :admin_role, :boolean, default: false
    add_column :lydusers, :asocial_role, :boolean, default: true
    add_column :lydusers, :boperativos_role, :boolean, default: false 
  end
end
