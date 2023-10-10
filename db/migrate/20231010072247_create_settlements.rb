class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.string     :payment, null: false
      t.references :user   , null: false, foreign_key: true
      t.references :bank   , null: false, foreign_key: true
      t.timestamps
    end
  end
end
