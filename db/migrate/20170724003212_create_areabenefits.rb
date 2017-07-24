class CreateAreabenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :areabenefits do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
