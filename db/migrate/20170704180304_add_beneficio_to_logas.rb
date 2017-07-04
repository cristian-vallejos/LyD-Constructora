class AddBeneficioToLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :beneficio, :string
  end
end
