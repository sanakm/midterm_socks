class EditsAgain < ActiveRecord::Migration
  def change
    rename_column :comments, :type, :feedback
  end
end