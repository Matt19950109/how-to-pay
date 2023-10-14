class Spending < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :settlement

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # バリデーション
  validates :price,       numericality: { only_integer: true, less_than_or_equal_to: 99999999, message: "is out of range" }
  validates :item_name,   presence: true
  validates :category_id, numericality: true
  validates :start_time,  presence: true
end
