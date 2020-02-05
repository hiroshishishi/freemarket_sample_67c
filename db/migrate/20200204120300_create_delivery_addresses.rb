class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastname_kana, null: false
      t.string :firstname_kana, null: false
      t.string :zip_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :block_room, null: false
      t.string :telephone, null: false, unique: true
      t.timestamps
    end
  end
end
