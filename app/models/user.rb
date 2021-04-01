class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :user_buy_addresses
  
  
  with_options presence: true do
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :first_name_katakana
      validates :last_name_katakana
    end
    validates :nickname
    validates :birthday
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
end
