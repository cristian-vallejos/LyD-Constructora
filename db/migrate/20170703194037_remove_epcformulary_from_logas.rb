class RemoveEpcformularyFromLogas < ActiveRecord::Migration[5.1]
  def change
    remove_reference :logas, :epcformulary, foreign_key: true
  end
end
