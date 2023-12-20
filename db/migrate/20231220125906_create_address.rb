class CreateAddress < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :addressble_id
      t.string :addressble_type
      t.integer :address_type
      t.timestamps
    end
  end
end
