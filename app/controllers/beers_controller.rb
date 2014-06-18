class BeersController < ApplicationController
	def index
		@beers = Beers.all
	end
end
