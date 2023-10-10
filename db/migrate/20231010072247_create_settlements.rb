class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|

      t.timestamps
    end
  end
end
