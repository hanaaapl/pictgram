class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_secure_password
  validates :password, length: {maximum: 32}, length: {minimum: 8}
  #/^(?=.*[0-9])(?=.*[A-Za-z])(?=.*[-&'()+@_.])[-\w&'()+@.]+$/
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
