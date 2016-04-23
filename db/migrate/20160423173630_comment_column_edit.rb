class CommentColumnEdit < ActiveRecord::Migration
  def change
    change_column :users, :account_type, :string
  end
end
