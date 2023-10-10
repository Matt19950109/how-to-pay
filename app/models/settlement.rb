class Settlement < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :bank

  # バリデーション(ユーザーごとに同じ決済方法が重複で登録できないように設定)
  validates :payment, presence: true, uniqueness: { scope: :user }, length: { maximum: 30 }

end
