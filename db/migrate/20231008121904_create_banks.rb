class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.string     :name        , null: false
      t.integer    :amount_price, null: false
      t.references :user        , null: false, foreign_key: true
      t.timestamps
    end
  end
end
