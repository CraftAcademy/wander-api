class Like < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  #validates_presence_of :value, :user, :trail 
  #validates :user_id, uniqueness: { scope: [:trail] }
end