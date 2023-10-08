class Bank < ApplicationRecord
  # アソシエーション
  belongs_to :user
  
  # バリデーション
  validates :name, presence: true, length: { maximum: 30 }
end
