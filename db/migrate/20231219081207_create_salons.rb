class CreateSalons < ActiveRecord::Migration[7.1]
  def change
    create_table :salons do |t|
      t.string "salon_name"
      t.string "owner_name"
      t.string "address"
      t.date "shop_start_time"
      t.date "shop_end_time"
      t.string "shop_availability", default: false
      t.string "email"
      t.bigint "mobile_number"
      t.integer "rating"
      t.string "password_digest"
      t.timestamps
    end
  end
end
