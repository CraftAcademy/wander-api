class Like < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  validates_presence_of :value, :user, :reference 
  valides :user_id, uniqueness: { scope: [:reference_id] }
end
