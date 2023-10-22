class Settlement < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :bank
  has_many   :spendings, dependent: :delete_all

  # バリデーション(ユーザーごとに同じ決済方法が重複で登録できないように設定)
  validates :payment, presence: true, uniqueness: { scope: :user }, length: { maximum: 30 }

  def self.ransackable_attributes(auth_object = nil)
    ["payment"]
  end
end
