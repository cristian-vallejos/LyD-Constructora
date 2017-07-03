class CreateLogas < ActiveRecord::Migration[5.1]
  def change
    create_table :logas do |t|
      t.integer :asocial_id
      t.references :epcformulary, foreign_key: true
      t.string :user_name
      t.integer :codigo_obra
      t.string :rut_atendido
      t.string :nombre_atendido
      t.string :apellido_paterno_atendido
      t.string :apellido_materno_atendido
      t.string :aspcategory_name
      t.string :solucion
      t.boolean :estado
      t.boolean :subcontrato
      t.string :supervisor
      t.text :descripcion
      t.string :rut_pariente
      t.string :nombre_pariente
      t.string :apellido_paterno_pariente
      t.string :apellido_materno_pariente
      t.string :parentezco
      t.string :empresa
      t.string :comentarios_caso
      t.boolean :caso_amerita_epc
      t.string :derivar_a
      t.datetime :fecha_as
      t.datetime :fecha_epc

      t.timestamps
    end
  end
end
