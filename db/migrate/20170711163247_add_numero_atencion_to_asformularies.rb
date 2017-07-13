class AddNumeroAtencionToAsformularies < ActiveRecord::Migration[5.1]
  def change
    add_column :asformularies, :numero_atencion, :integer
  end
end
