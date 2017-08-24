class AddNombrebeneficiarioToLogbenefitsfinals < ActiveRecord::Migration[5.1]
  def change
    add_column :logbenefitsfinals, :nombrebeneficiario, :string
  end
end
