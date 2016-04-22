class EditCol1 < ActiveRecord::Migration
  def change
    change_column :services, :service_start, :timestamp
  end
end
