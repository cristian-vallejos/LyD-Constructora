class AddActivoToObras < ActiveRecord::Migration[5.1]
  def change
    add_column :obras, :is_active, :boolean, default: true
  end
end
