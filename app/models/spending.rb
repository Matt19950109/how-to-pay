class Spending < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :settlement
  has_one_attached :image
  has_one :bank, through: :settlement

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # バリデーション
  validates :price,         presence: true
  validates :price,         numericality: { only_integer: true, less_than_or_equal_to: 99999999, message: "を1億円以内に設定してください" }
  validates :item_name,     presence: true
  validates :category_id,   numericality: { message: "を選択してください"}
  validates :start_time,    presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["price", "item_name", "category_id", "start_time", "settlement_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["settlement"]
  end
end
