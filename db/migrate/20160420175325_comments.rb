class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.string :type
      # t.reference :user_id
    end
  end
end