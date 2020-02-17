class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastname_kana, null: false
      t.string :firstname_kana, null: false
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :block_room
      t.string :telephone,  unique: true
      t.timestamps
    end
  end
end
