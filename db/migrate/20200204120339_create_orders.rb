class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :buyer_user, null: false, foreign_key: {to_table: :users}
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
