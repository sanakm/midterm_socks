class ServiceCol < ActiveRecord::Migration
  def change
    rename_column :services, :service_start, :created_at
    rename_column :services, :service_end, :updated_at
  end
end
