require 'rubygems'
require 'engtagger'

class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :checkins
	belongs_to :style

	   



end