class ChangeCommentColumn < ActiveRecord::Migration
  def change
    change_column :users, :account_type, :boolean
  end
end
