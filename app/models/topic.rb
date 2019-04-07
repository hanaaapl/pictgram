class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  has_secure_password

  belongs_to :user
  has_many :topics
end
