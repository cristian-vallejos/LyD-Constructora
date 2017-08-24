class CreateLogbenefitsfinals < ActiveRecord::Migration[5.1]
  def change
    create_table :logbenefitsfinals do |t|
      t.string :areabeneficio
      t.string :nombrebeneficio
      t.string :costoempresa
      t.string :costotrabajador
      t.string :ruttrabajador
      t.string :nombretrabajador
      t.string :rutbeneficiario
      t.string :relacion
      t.string :nombreobra
      t.integer :asistebeneficio
      t.integer :Idasignacionbeneficio

      t.timestamps
    end
  end
end
