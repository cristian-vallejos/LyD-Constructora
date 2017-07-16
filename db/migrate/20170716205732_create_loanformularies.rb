class CreateLoanformularies < ActiveRecord::Migration[5.1]
  def change
    create_table :loanformularies do |t|
      t.string :nombre_solicitante
      t.string :rut_solicitante
      t.integer :obra
      t.string :cargo
      t.integer :monto_solicitado
      t.integer :monto_aprobado
      t.integer :numero_cuotas
      t.integer :monto_cuota
      t.integer :renta_liquida
      t.integer :antiguedad
      t.datetime :fecha_ultimo_contrato
      t.integer :fondo_finiquito
      t.integer :continuidad_en_obra
      t.integer :descuentos_en_curso
      t.text :descripcion_documentos_respaldo
      t.text :motivo_solicitud
      t.text :comentarios
      t.boolean :aceptado_por_as, default: nil
      t.boolean :aceptado_por_administrativo_obra, default: nil
      t.boolean :aceptado_por_subgerente_personas, default: nil
      t.boolean :aceptado_por_jefe_remuneraciones, default: nil
      t.boolean :cerado, default: false

      t.timestamps
    end
  end
end
