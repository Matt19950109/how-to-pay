class Bank < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
end
