class AddEpcformularyIdFromLogas < ActiveRecord::Migration[5.1]
  def change
    add_column :logas, :epcformulary_id, :integer
  end
end
