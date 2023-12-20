class CreateBankDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_details do |t|
      t.bigint "account_number"
      t.string "bank_name"
      t.string "IFSC_code"
      t.string "location"
      t.bigint "owner_id"
      t.timestamps
    end
  end
end
