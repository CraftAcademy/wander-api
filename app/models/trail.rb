class Trail < ApplicationRecord
  validates_presence_of :title, :description, :intensity, :duration, :location
end
