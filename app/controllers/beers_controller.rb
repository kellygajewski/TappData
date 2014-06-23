require 'rubygems'
require 'engtagger'

class BeersController < ApplicationController
	def index
		@beers = Beer.all
	end
end
