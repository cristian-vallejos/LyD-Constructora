class AddCargo < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :cargo, :string
  end
end
