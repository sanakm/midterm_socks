class EditColumns < ActiveRecord::Migration
  def change
    change_column :services, :socks_per_month, :integer 
  end
end
