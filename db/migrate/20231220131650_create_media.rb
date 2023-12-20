class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.string :url
      t.string :name
      t.integer :mediable_id
      t.string :mediable_type
      t.timestamps
    end
  end
end
