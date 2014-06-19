class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :checkins
	has_many :user_beers
	has_many :users, through: :user_beers
	belongs_to :style
end
