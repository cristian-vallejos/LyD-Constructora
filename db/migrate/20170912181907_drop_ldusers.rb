class DropLdusers < ActiveRecord::Migration[5.1]
  def change
  	drop_table :ldusers
  	drop_table :ldusers2
  end
end
