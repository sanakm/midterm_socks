class Sizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size_desc
    end
  end
end
