class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string "name"
      t.boolean "shop_availability"
      t.datetime "shop_start_time"
      t.datetime "shop_end_time"
      t.bigint "full_phone_number"
      t.timestamps
    end
  end
end
