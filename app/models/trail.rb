class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :location, :latitude, :longitude, :continent
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
  has_one_attached :image
  belongs_to :user

  has_many :bookmarks, through: :user
end