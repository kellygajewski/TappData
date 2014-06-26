class BeerdataController < ApplicationController

  	# before_action :get_single_feed, only: [:index]
  	# before_action :get_feed, only: [:feed]

  	def index  	
  # 		@month_counts=[]
		# @jan_count = []
		# @feb_count = []
		# @mar_count = []
		# @apr_count = []
		# @may_count = []
		# @jun_count = []
		# @jul_count = []
		# @aug_count = []
		# @sep_count = []
		# @oct_count = []
		# @nov_count = []
		# @dec_count = []
  # 		main_style(@response)
  	end

  	def feed
  		@username = params[:username] || "kelly310"
		@response = Untappd::User.feed(@username, {:limit => 50}).checkins.items
  		@month_counts=[]
		@jan_count = []
		@feb_count = []
		@mar_count = []
		@apr_count = []
		@may_count = []
		@jun_count = []
		@jul_count = []
		@aug_count = []
		@sep_count = []
		@oct_count = []
		@nov_count = []
		@dec_count = []	

		@response.each do |r|
  			main_style(r)
  		end
  	end

	#Should return the top 3 nouns, noun phrases, or adjectives per description sample using the Engtagger gem
	def self.top_words
		tgr = EngTagger.new
		# self.each do |b|
		# 	desc_array.push(b.beer_description)
		# end
		# desc_string = desc_array.join(" ")
		desc_string = "hops hops hops coffee coffee beer yum yum yum"
		tagged = tgr.add_tags(desc_string)
		nouns = tgr.get_words(tagged)
		adj = tgr.get_adjectives(tagged)
		words = nouns.merge(adj)
		words.sort {|k,v| k[-1]<=>v[-1]}
		return "#{words[0][0]}, #{words[1][0]}, #{words[2][0]}"
	end

	



	def get_feed
		
	end


	def get_single_feed
		@response = Untappd::User.feed("kelly310", :limit => 50).checkins.items[0]
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



	


	def month_finder(response, category)

		month = response.created_at[8..10]
		if month == "Jan"
			@jan_count.push(category)
		elsif month == "Feb"
			@feb_count.push(category)
		elsif month == "Mar"
			@mar_count.push(category)
		elsif month == "Apr"
			@apr_count.push(category)
		elsif month == "May"
			@may_count.push(category)
		elsif month == "Jun"
			@jun_count.push(category)
		elsif month == "Jul"
			@jul_count.push(category)
		elsif month == "Aug"
			@aug_count.push(category)
		elsif month == "Sep"
			@sep_count.push(category)
		elsif month == "Oct"
			@oct_count.push(category)
		elsif month == "Nov"
			@nov_count.push(category)
		elsif month == "Dec"
			@dec_count.push(category)
		end

		@month_counts=[]
		@month_counts.push(@jan_count)
		@month_counts.push(@feb_count)
		@month_counts.push(@mar_count)
		@month_counts.push(@apr_count)
		@month_counts.push(@may_count)
		@month_counts.push(@jun_count)
		@month_counts.push(@jul_count)
		@month_counts.push(@aug_count)
		@month_counts.push(@sep_count)
		@month_counts.push(@oct_count)
		@month_counts.push(@nov_count)
		@month_counts.push(@dec_count)
		calc_beer_months(@month_counts)

	end

	
#Creates 2D array of the number of checkins per each month (rows/layers) per beer style (columns/bars). Next step is to convert each element into an object where each x is the column index (relates to each style) and each y is the number of checkins for that beer style per month ie {x: 0, y: 23} and this array can then be fed into the D3 stacked bar chart.
	def calc_beer_months(x)
		@top_beer_styles=["Porter", "Stout", "Brown Ale", "Pale Ale", "Wheat Beer", "Other Ale", "American Light Lager", "Other Lager", "Pilsner", "Cider", "Other"]

		@beer_months = Array.new(12) { Array.new(11, 0)}

		#for each of the arrays in month_counts corresponding to each month
		@month_counts.each do |x|
			#for each checkin in that month
	      x.each do |that_months_beer|
	      	#for each style in the beer styles array
	        @top_beer_styles.each do |one_beer_style|
	        	#if the beer style of the checkin equals the beer style in the array, increment the value of number of beers for that style for that month
	          if (that_months_beer == one_beer_style)  
	            @beer_months[@month_counts.index(x)][@top_beer_styles.index(one_beer_style)]+=1
	            $beertestz = 1
	          end	     
	        end
	      end
		end

		@awesomeness = []
		@beer_months.each do |m|
			this_month = []
			(0...m.length).each do |s_idx|
				this_month << {x: s_idx, y: m[s_idx]}
			end
			@awesomeness << this_month
		end
	end
	

#Should return the broader category for a beer given its beer_style
	# def main_style
	# 	if self.beer_style.include?("Porter")
	# 		return "Porter"
	# 	elsif self.beer_style.include?("Stout")
	# 		return "Stout"
	# 	elsif self.beer_style.include?("Brown Ale") || self.beer_style.include?("Dubbel")
	# 		return "Brown Ale" 
	# 	elsif ((self.beer_style.include?("Pale") || self.beer_style.include?("Amber") || self.beer_style.include?("Red") ||  self.beer_style.include?("Blonde") || self.beer_style.include?("Scottish")) && self.beer_style.include?("Ale")) || self.beer_style.include?("Belgian Blonde") || self.beer_style.include?("IPA") || self.beer_style.include?("Barleywine") || self.beer_style.include?("Bière de Garde") || self.beer_style.include?("Saison") || self.beer_style.include?("Bitter")
	# 		return "Pale Ale" 
	# 	elsif self.beer_style.include?("Hefeweizen") || self.beer_style.include?("Witbier")
	# 		return "Wheat Beer"
	# 	elsif self.beer_style.include?("Ale") || self.beer_style.include?("Altbier") || self.beer_style.include?("Quadrupel")
	# 		return "Other Ale"
	# 	elsif self.beer_style.include?("American Adjunct Lager") || self.beer_style.include?("American Light Lager")
	# 		return "American Lager"
	# 	elsif self.beer_style.include?("Lager") || self.beer_style.include?("bock") || self.beer_style.include?("Bock")
	# 		return "Other Lager"
	# 	elsif self.beer_style.include?("Pilsner")
	# 		return "Pilsner"
	# 	elsif self.beer_style.include?("Cider")
	# 		return "Cider"
	# 	else
	# 		return "Other"
	# 	end	
	private

	def user_params
      	params.require(:user).permit(:first_name)
    end

end