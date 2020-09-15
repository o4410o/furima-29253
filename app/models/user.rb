class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      with_options presence: true do
         validates :nickname
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format:{with: PASSWORD_REGEX}

         with_options format: { with:/\A[ぁ-んァ-ン一-龥]+\z/} do
           validates :kanji_family_name 
           validates :kanji_first_name
         end
         with_options format: { with:/\A[ぁ-んァ-ン]+\z/,} do
         validates :kana_family_name 
         validates :kana_first_name 
         end

         validates :birthday
      end
end
