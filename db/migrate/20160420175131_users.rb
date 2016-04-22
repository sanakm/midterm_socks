class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :account_type, default: false
      t.string :name
      t.string :email
      t.string :phone
      t.string :password
      t.string :address
      t.string :city
      t.string :postalcode
      t.timestamp :created_at
      t.date :deactivate, default: nil
      # t.reference :service_id
      # t.reference :size_id
      
    end
  end
end