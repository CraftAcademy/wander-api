class Like < ApplicationRecord
  belongs_to :trail
  belongs_to :user
  validates_presence_of :value, :user, :reference 
  valides :user_id, uniqueness: { scope: [:reference_id] }
end
