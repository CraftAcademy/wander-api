class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :city, :country, :continent
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
  has_one_attached :image
  belongs_to :user
  has_many :coordinates

  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
end