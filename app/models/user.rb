class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :trails

  has_many :bookmarks
  has_many :bookmarked_trails, through: :bookmarks, source: :trail
end