class Services < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :socks_per_month
      t.integer :cost
      t.timestamp :service_start
      t.date :service_end, default: nil
    end
  end
end