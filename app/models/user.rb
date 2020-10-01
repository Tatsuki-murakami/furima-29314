class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :email
    validates :encrypted_password
    validates :nickname
    validates :birthday
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :family_name_hurigana, format: { with: / \ A [ァ-ヶー－] + \ z /, message: '全角カタカナを使用してください' }
    validates :name_hurigana, format: { with: / \ A [ァ-ヶー－] + \ z /, message: '全角カタカナを使用してください' }
    validates :email, uniqueness: true
    validates :encrypted_password, length: { minimum: 6 }
    validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
  
end
