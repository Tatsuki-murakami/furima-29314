class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, :name, :family_name_furigana, :name_hurigana, :email, 
             presence: true

  validates :family_name,          presence: true
  validates :name,                 presence: true
  validates :family_name_hurigana, presence: true
  validates :name_hurigana,        presence: true
  validates :email,                presence: true
  validates :encrypted_password,   presence: true
  validates :nickname,             presence: true
  validates :birthday,             presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
       validates :family_name
       validates :name
       validates :family_name_hurigana
       validates :name_hurigana
  end

  validates :email, uniqueness: true
  validates :encrypted_password, length: { minimum: 6 }
  validates :encrypted_password,    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  with_options presence: true, format: { with: / \ A [ァ-ヶー－] + \ z /, message: '全角カタカナを使用してください' } do
    validates :family_name_hurigana
    validates :name_hurigana
 end
end
