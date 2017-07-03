class CreateAsformularies < ActiveRecord::Migration[5.1]
  def change
    create_table :asformularies do |t|
      t.integer :rut_atendido
      t.integer :codigo_obra
      t.references :user, foreign_key: true
      t.string :nombre_atendido
      t.string :apellido_paterno
      t.string :apellido_materno
      t.references :aspcategory, foreign_key: true
      t.string :solucion
      t.boolean :estado
      t.boolean :subcontrato
      t.string :nombre_supervisor
      t.text :descripcion

      t.timestamps
    end
  end
end
