class CreateAssignbenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :assignbenefits do |t|
      t.references :benefit, foreign_key: true
      t.string :rut_trabajador
      t.string :rut_beneficiario
      t.string :relacion
      t.date :fecha_nacimiento
      t.references :obra, foreign_key: true

      t.timestamps
    end
  end
end
