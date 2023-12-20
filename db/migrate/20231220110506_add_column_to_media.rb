class AddColumnToMedia < ActiveRecord::Migration[7.1]
  def change
    add_reference :media, :mediable, polymorphic: true, null: false
  end
end
