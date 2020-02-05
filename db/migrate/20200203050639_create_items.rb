class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :seller_user, null: false, foreign_key: {to_table: :users}
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :name, null: false
      t.text :text, null: false
      t.integer :condition, null: false
      t.integer :price, null: false
      t.boolean :trading_status, null: false
      t.datetime :completed_at, null: false
      t.timestamps
    end
  end
end
