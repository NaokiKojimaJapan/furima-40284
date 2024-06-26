class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,        presence: true
  validates :last_name,       presence: true
  validates :first_name,      presence: true
  validates :kana_last_name,  presence: true
  validates :kana_first_name, presence: true
  validates :birth_date,      presence: true

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角（カタカナ）を使用してください' } do
    validates :kana_first_name
    validates :kana_last_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
