class Bookmark < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :trails
end
