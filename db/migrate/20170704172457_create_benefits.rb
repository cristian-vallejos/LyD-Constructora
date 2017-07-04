class CreateBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits do |t|
      t.string :nombre
      t.string :area
      t.integer :costotrabajador
      t.integer :costoempresa

      t.timestamps
    end
  end
end
