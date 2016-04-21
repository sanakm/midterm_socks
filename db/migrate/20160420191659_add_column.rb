class AddColumn < ActiveRecord::Migration
  def change
    add_reference :users, :services, index: true, foreign_key: true
    add_reference :users, :sizes, index: true, foreign_key: true
    add_reference :orders, :services, index: true, foreign_key: true
    add_reference :orders, :users, index: true, foreign_key: true
    add_reference :comments, :users, index: true, foreign_key: true
  end
end
