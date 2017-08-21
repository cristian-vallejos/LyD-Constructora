class CreateFamiliartrabajadors < ActiveRecord::Migration[5.1]
  def change
    create_table :familiartrabajadors do |t|
      t.string :rut
      t.string :nombre
      t.string :relacion
      t.date :fechanacimiento
      t.string :rut_trabajador

      t.timestamps
    end
  end
end
