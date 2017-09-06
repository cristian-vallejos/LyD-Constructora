class AddAoToLydusers < ActiveRecord::Migration[5.1]
  def change
    add_column :lydusers, :AO_role, :boolean, default: false
  end
end
