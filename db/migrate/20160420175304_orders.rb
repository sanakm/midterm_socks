class Orders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_made
      # t.reference :service_id
      # t.reference :user_id
    end
  end
end