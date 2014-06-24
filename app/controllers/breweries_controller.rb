class BreweriesController < ApplicationController

	def index

		response = Untappd::User.feed("Kelly310").checkins.items
		i = 0
		while i < response.length do
	        response[i].beer.beer_name
	        i += 1
	    end
	end

	
    # @beers = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/beers.json")
    # @checkins = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/checkins.json")
    # @users = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/users.json")
    # @style = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/styles.json")


  def beer_ratings
  end
end
