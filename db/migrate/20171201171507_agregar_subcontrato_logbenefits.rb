class AgregarSubcontratoLogbenefits < ActiveRecord::Migration[5.1]
  def change
    add_column :logbenefitsfinals, :subcontrato, :boolean, default: false
    add_column :logbenefitsfinals, :nombre_subcontrato , :string
  end
end
