class CreateAsignarmultiplebeneficios < ActiveRecord::Migration[5.1]
  def change
    create_table :asignarmultiplebeneficios do |t|
      t.references :employee, foreign_key: true
      t.references :obra, foreign_key: true
      t.references :areabenefit, foreign_key: true
      t.references :benefit, foreign_key: true

      t.timestamps
    end
  end
end
