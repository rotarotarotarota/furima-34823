class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  NAME_KANA_REGEX = /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/.freeze

  with_options format: { with: PASSWORD_REGEX, message: 'must include both letters and numbers' } do
    validates :password
  end
  with_options presence: true do
    validates :nickname, :date_of_birth
    with_options format: { with: NAME_REGEX, message: 'must be full-width characters' } do
      validates :last_name, :first_name
    end
    with_options format: { with: NAME_KANA_REGEX, message: 'must be full-width katakana characters' } do
      validates :last_name_kana, :first_name_kana
    end
  end
end
