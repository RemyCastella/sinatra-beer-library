class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites
end
