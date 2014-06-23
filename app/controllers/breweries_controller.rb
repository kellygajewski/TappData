class BreweriesController < ApplicationController

	def index
	@untappd = Untappd::User.feed
    @beers = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/beers.json")
    @checkins = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/checkins.json")
    @users = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/users.json")
    @style = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/styles.json")
  end

  def beer_ratings
  end
end
