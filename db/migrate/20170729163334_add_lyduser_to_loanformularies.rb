class AddLyduserToLoanformularies < ActiveRecord::Migration[5.1]
  def change
    add_reference :loanformularies, :lyduser, foreign_key: true
  end
end
