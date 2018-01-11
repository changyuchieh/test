class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :address
      t.string :tel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
