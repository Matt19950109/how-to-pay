class Bank < ApplicationRecord
  # アソシエーション
  belongs_to :user
  
  # バリデーション(ユーザーごとに同じ銀行名が重複できないように設定)
  validates :name, presence: true, uniqueness: { scope: :user}, length: { maximum: 30 }
end
