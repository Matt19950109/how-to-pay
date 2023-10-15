class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.integer    :price,       null: false
      t.string     :item_name,   null: false
      t.integer    :category_id, null: false
      t.date       :start_time,  null: false
      t.references :user,        null: false, foreign_key: true
      t.references :settlement,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
