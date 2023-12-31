class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_many :banks
  has_many :settlements
  has_many :spendings
  
  # バリデーション
  validates :nickname, presence: true, length: { maximum: 12 }

  #パスワードの数字混合のみ許可する
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '（確認用）とパスワードの入力が一致しません'}

end
