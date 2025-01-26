class Beer < ActiveRecord::Base
  belongs_to :brand
  has_many :favorites
  has_many :users, through: :favorites
end
