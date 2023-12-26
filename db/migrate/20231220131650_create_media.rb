class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.string :url
      t.string :name
      t.references :mediable, polymorphic: true
      t.timestamps
    end
  end
end
