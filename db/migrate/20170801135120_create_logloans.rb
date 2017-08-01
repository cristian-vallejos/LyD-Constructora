class CreateLogloans < ActiveRecord::Migration[5.1]
  def change
    create_table :logloans do |t|
      t.string :rut_solicitante
      t.string :nombre_solicitante
      t.string :empresa
      t.string :obra
      t.string :cargo
      t.string :monto_solicitado
      t.string :numero_cuotas
      t.string :monto_pagado
      t.string :por_pagar
      t.text :motivo_solicitud
      t.text :comentarios
      t.string :estado

      t.timestamps
    end
  end
end
