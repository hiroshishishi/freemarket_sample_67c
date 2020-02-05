class CreateSocialProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :social_providers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider, null: false
      t.timestamps
    end
  end
end
