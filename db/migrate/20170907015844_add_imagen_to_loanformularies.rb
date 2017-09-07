class AddImagenToLoanformularies < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :loanformularies, :image
  end
 
  def self.down
    remove_attachment :loanformularies, :image
  end
end
