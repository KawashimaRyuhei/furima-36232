class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    
    with_options length: { minimum: 6 },format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'Please include both letters and numbers in your settings' } do
      validates :encrypted_password
      validates :password
      validates :password_confirmation
    end                                                               
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
      validates :first_name 
      validates :last_name
    end
    
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :kana_first_name
      validates :kana_last_name
    end
    
    validates :birthday
  end

  has_many :items
  has_many :buys
end
