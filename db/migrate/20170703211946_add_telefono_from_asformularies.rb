class AddTelefonoFromAsformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :asformularies, :telefono, :integer
  end
end
