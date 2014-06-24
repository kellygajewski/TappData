# require 'rubygems'
# require 'engtagger'

class BeersController < ApplicationController

	def index	

		

	    @response = Untappd::User.feed("Kelly310").checkins.items
	    r = 0
	    while r < @response.length
		    single_checkin = @response[r]
		    main_style(single_checkin)
		    r += 1
		end

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

		$jan_count = []
		$feb_count = []
		$mar_count = []
		$apr_count = []
		$may_count = []
		$jun_count = []
		$jul_count = []
		$aug_count = []
		$sep_count = []
		$oct_count = []
		$nov_count = []
		$dec_count = []

	def month_finder(response, category)
		
		month = response.created_at[8..10]
		if month == "Jan"
			$jan_count.push(category)
		elsif month == "Feb"
			$feb_count.push(category)
		elsif month == "Mar"
			$mar_count.push(category)
		elsif month == "Apr"
			$apr_count.push(category)
		elsif month == "May"
			$may_count.push(category)
		elsif month == "Jun"
			$jun_count.push(category)
		elsif month == "Jul"
			$jul_count.push(category)
		elsif month == "Aug"
			$aug_count.push(category)
		elsif month == "Sep"
			$sep_count.push(category)
		elsif month == "Oct"
			$oct_count.push(category)
		elsif month == "Nov"
			$nov_count.push(category)
		elsif month == "Dec"
			$dec_count.push(category)
		end
		@jan_total = $jan_count
		@feb_total = $feb_count
		@mar_total = $mar_count
		@apr_total = $apr_count
		@may_total = $may_count
		@jun_total = $jun_count
		@jul_total = $jul_count
		@aug_total = $aug_count
		@sep_total = $sep_count
		@oct_total = $oct_count
		@nov_total = $nov_count
		@dec_total = $dec_count
	end

	def main_style(response)
		if response.beer.beer_style.include?("Porter")
			month_finder(response, "Porter")
			return "Porter"
		elsif response.beer.beer_style.include?("Stout")
			month_finder(response, "Stout")
			return "Stout"
		elsif response.beer.beer_style.include?("Brown Ale") || response.beer.beer_style.include?("Dubbel")
			month_finder(response, "Brown Ale")
			return "Brown Ale" 
		elsif ((response.beer.beer_style.include?("Pale") || response.beer.beer_style.include?("Amber") || response.beer.beer_style.include?("Red") ||  response.beer.beer_style.include?("Blonde") || response.beer.beer_style.include?("Scottish")) && response.beer.beer_style.include?("Ale")) || response.beer.beer_style.include?("Belgian Blonde") || response.beer.beer_style.include?("IPA") || response.beer.beer_style.include?("Barleywine") || response.beer.beer_style.include?("Bière de Garde") || response.beer.beer_style.include?("Saison") || response.beer.beer_style.include?("Bitter")
			month_finder(response, "Pale Ale")
			return "Pale Ale" 
		elsif response.beer.beer_style.include?("Hefeweizen") || response.beer.beer_style.include?("Witbier")
			month_finder(response, "Wheat Beer")
			return "Wheat Beer"
		elsif response.beer.beer_style.include?("Ale") || response.beer.beer_style.include?("Altbier") || response.beer.beer_style.include?("Quadrupel")
			month_finder(response, "Other Ale")
			return "Other Ale"
		elsif response.beer.beer_style.include?("American Adjunct Lager") || response.beer.beer_style.include?("American Light Lager")
			month_finder(response, "American Lager")
			return "American Lager"
		elsif response.beer.beer_style.include?("Lager") || response.beer.beer_style.include?("bock") || response.beer.beer_style.include?("Bock")
			month_finder(response, "Other Lager")
			return "Other Lager"
		elsif response.beer.beer_style.include?("Pilsner")
			month_finder(response, "Pilsner")
			return "Pilsner"
		elsif response.beer.beer_style.include?("Cider")
			month_finder(response, "Cider")
			return "Cider"
		else
			month_finder(response, "Other")
			return "Other"
		end	
	end


end


