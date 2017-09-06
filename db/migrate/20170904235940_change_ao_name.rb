class ChangeAoName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :lydusers, :AO_role, :ao_role
  end
end
