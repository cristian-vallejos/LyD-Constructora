class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :rut
      t.string :nombre
      t.string :cencos
      t.string :estado

      t.timestamps
    end
  end
end
