class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :trail
  has_many :bookmarks
  has_many :trails
  has_many :trail_bookmarks, through: :trails, source: :bookmarks
end
