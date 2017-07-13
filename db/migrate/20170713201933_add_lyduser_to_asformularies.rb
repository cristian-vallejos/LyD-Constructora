class AddLyduserToAsformularies < ActiveRecord::Migration[5.1]
  def change
    add_reference :asformularies, :lyduser, foreign_key: true
  end
end
