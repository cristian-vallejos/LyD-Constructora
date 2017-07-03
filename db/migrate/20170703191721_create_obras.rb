class CreateObras < ActiveRecord::Migration[5.1]
  def change
    create_table :obras do |t|
      t.string :nombre
      t.string :direccion

      t.timestamps
    end
  end
end
