class BreweriesController < ApplicationController
	def index
    @breweries = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/breweries.json")
    @beers = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/beers.json")
    @checkins = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/checkins.json")
  end

  def create
    response = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/breweries.json")

  end
end
