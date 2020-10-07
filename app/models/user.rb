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
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :family_name,          format:  { with: NAME_REGEX, message: 'は全角で入力してください。'}
    validates :name,                 format:  { with: NAME_REGEX, message: 'は全角で入力してください。'}
    NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_furigana, format: { with: NAME_READING_REGEX, message: 'は全角カタカナで入力して下さい。'}
    validates :name_furigana,        format: { with: NAME_READING_REGEX, message: 'は全角カタカナで入力して下さい。'}
    validates :email, uniqueness: true
    validates :encrypted_password,   length: { minimum: 6 }
  end
end
