class Bank < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many   :settlements
  
  # バリデーション(ユーザーごとに同じ銀行名が重複で登録できないように設定)
  validates :amount_price, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }, length: { maximum: 30 }
end
