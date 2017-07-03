class CreateAspcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :aspcategories do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
