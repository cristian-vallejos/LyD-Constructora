class ChangeEstadodeLoanaNull < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:loanformularies, :estado, nil)
  end
end
