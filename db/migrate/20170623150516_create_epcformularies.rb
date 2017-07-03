class CreateEpcformularies < ActiveRecord::Migration[5.1]
  def change
    create_table :epcformularies do |t|
      t.references :asformulary, foreign_key: true
      t.integer :rut_atendido
      t.string :codigo
      t.string :nombre_pariente
      t.string :apellido_paterno_pariente
      t.string :apellido_materno_pariente
      t.integer :rut_pariente
      t.string :parentesco
      t.string :empresa
      t.integer :codigo_obra
      t.text :comentarios_caso
      t.boolean :caso_amerita_epc
      t.string :derivar_a

      t.timestamps
    end
  end
end
