class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :deliveryday_id, null: false
      t.integer :price, null: false
      t.references :seller, null: false, foreign_key: {to_table: :users}
      t.references :buyer, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
