class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :location
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
end