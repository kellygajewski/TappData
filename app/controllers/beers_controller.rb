# require 'rubygems'
# require 'engtagger'
class BeersController < ApplicationController
	def index	
	    @response = Untappd::User.feed("Kelly310").checkins.items
	    hello = Untappd::User.feed("Kelly310").checkins.items[2]
	    @hello = main_style(hello)

	end

	def style_counter()
	end


	def loop_maker
		i = 0
		@response = Untappd::User.feed("Kelly310").checkins.items
		while i < response.length
	        response[i].month_finder
	        
	        i += 1
	    end
	end

	def month_finder(response, style)
		jan_count = []
		feb_count = []
		mar_count = []
		apr_count = []
		may_count = []
		jun_count = []
		jul_count = []
		aug_count = []
		sep_count = []
		oct_count = []
		nov_count = []
		dec_count = []
		month = response.created_at[8..10]
		if month == "Jan"
			jan_count.push(style)
		elsif month == "Feb"
			feb_count.push(style)
		elsif @month == "Mar"
			@month = "3"
		elsif @month == "Apr"
			@month = "4"
		elsif @month == "May"
			@month = "5"
		elsif month == "Jun"
			jun_count.push(style)
		elsif @month == "Jul"
			@month = "7"
		elsif @month == "Aug"
			@month = "8"
		elsif @month == "Sep"
			@month = "9"
		elsif @month == "Oct"
			@month = "10"
		elsif @month == "Nov"
			@month = 11
		elsif @month == "Dec"
			@month = "12"
		end
		@jun_total = jun_count.length
	end

	def main_style(response)
		if response.beer.beer_style.include?("Porter")
			month_finder(response)
			return "Porter"
		elsif response.beer.beer_style.include?("Stout")
			return "Stout"
		elsif response.beer.beer_style.include?("Brown Ale") || response.beer.beer_style.include?("Dubbel")
			return "Brown Ale" 
		elsif ((response.beer.beer_style.include?("Pale") || response.beer.beer_style.include?("Amber") || response.beer.beer_style.include?("Red") ||  response.beer.beer_style.include?("Blonde") || response.beer.beer_style.include?("Scottish")) && response.beer.beer_style.include?("Ale")) || response.beer.beer_style.include?("Belgian Blonde") || response.beer.beer_style.include?("IPA") || response.beer.beer_style.include?("Barleywine") || response.beer.beer_style.include?("Bière de Garde") || response.beer.beer_style.include?("Saison") || response.beer.beer_style.include?("Bitter")
			return "Pale Ale" 
		elsif response.beer.beer_style.include?("Hefeweizen") || response.beer.beer_style.include?("Witbier")
			month_finder(response, "Wheat Beer")
			return "Wheat Beer"
		elsif response.beer.beer_style.include?("Ale") || response.beer.beer_style.include?("Altbier") || response.beer.beer_style.include?("Quadrupel")
			return "Other Ale"
		elsif response.beer.beer_style.include?("American Adjunct Lager") || response.beer.beer_style.include?("American Light Lager")
			return "American Lager"
		elsif response.beer.beer_style.include?("Lager") || response.beer.beer_style.include?("bock") || response.beer.beer_style.include?("Bock")
			return "Other Lager"
		elsif response.beer.beer_style.include?("Pilsner")
			return "Pilsner"
		elsif response.beer.beer_style.include?("Cider")
			return "Cider"
		else
			return "Other"
		end	
	end


end


