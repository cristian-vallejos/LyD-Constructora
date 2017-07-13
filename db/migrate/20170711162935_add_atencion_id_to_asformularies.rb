class AddAtencionIdToAsformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :asformularies, :atencion_id, :integer
  end
end
