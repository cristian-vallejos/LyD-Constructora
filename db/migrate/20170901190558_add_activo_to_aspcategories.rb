class AddActivoToAspcategories < ActiveRecord::Migration[5.1]
  def change
    add_column :aspcategories, :is_active, :boolean, default: true
    add_column :areabenefits, :is_active, :boolean, default: true
    add_column :benefits, :is_active, :boolean, default: true
    add_column :lydusers, :is_active, :boolean, default: true
  end
end
