#Yes this controller is a mess...

class BeerdataController < ApplicationController

  	# before_action :get_single_feed, only: [:index]
  	# before_action :get_feed, only: [:feed]

  	def index  	

  	end

  	def feed

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

		#last_id_num = 0
		offset = 0
  		@username = params[:username] || "jennifermarie"
  		begin #starts rescue block
  		# @response = Untappd::User.feed(@username, {:limit => 50, :max_id => last_id_num}).checkins.items
  		# Gets user distinct beers, which unlike checkins contains beer descriptions. Unfortunately this also will not capture duplicate beers. The only alternative I came up with was calling checkins and then calling beer info on each checkin but of course that would drive up the number of API calls too high. Please still leave in the code for checkin feed for now though :)
  		@response = Untappd::User.distinct(@username, {:limit => 50, :offset => offset}).beers.items
  			while @response.length != 0
	  			@response.each do |r|
	  				main_style(r)
	  			end
	  			#last_id_num = @response.last.recent_checkin_id #@response.last.checkin_id
	  			# @response = Untappd::User.feed(@username, {:limit => 50, :max_id => last_id_num}).checkins.items
	  			offset += 50
	  			@response = Untappd::User.distinct(@username, {:limit => 50, :offset => offset}).beers.items
	  		end
	  	rescue StandardError
	  		redirect_to beerdatas_path
	  		puts "FAIL"
	  	ensure
	  	end
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
			elsif response.beer.beer_style.include?("Hefeweizen") || response.beer.beer_style.include?("Witbier") || response.beer.beer_style.include?("Wheat")
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

		# month = response.created_at[8..10]
		month = response.recent_created_at[8..10]
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

	
#Creates 2D array of the number of checkins per each month (rows/layers) per beer style (columns/bars). 
	def calc_beer_months(x)
		@top_beer_styles=["Porter", "Stout", "Brown Ale", "Pale Ale", "Wheat Beer", "Other Ale", "Pilsner", "American Light Lager", "Other Lager", "Cider", "Other"]

		#creates a 12 x 11 array of 0s
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
	          end	     
	        end
	      end
		end

#Last minute fix to get the data in the proper format for D3. Each element is converted into an object where each x is the column index (relates to each style) and each y is the number of checkins for that beer style per month ie {x: 0, y: 23} and this array can then be fed into the D3 stacked bar chart. This could likely be handled better from an object-oriented standpoint.
		@beer_months_object = []
		@beer_months.each do |m|
			this_month = []
			(0...m.length).each do |s_idx|
				this_month << {x: s_idx, y: m[s_idx]}
			end
			@beer_months_object << this_month
		end
	end
	


#Finds the number of times each word or phrase occurs in beer descriptions using the Engtagger gem. Still under construction.
	#def self.top_words
	def top_words(response)
		tgr = EngTagger.new
		desc_array = []
		# self.each do |b|

		#Creates array of all beer descriptions
		response.each do |r|
			desc_array.push(r.beer.beer_description)
		end
		desc_string = desc_array.join(" ").downcase.delete "."

		#Adds parts of speech to each word in the descriptions
		tagged = tgr.add_tags(desc_string)
		#Collects all words tagged as nouns or noun phrases with the number of times they occur
		nouns = tgr.get_noun_phrases(tagged)
		#collects all words tagged as adjectives with the number of times they occur
		adj = tgr.get_adjectives(tagged)
		#Combines noun phrases and adjectives into one hash
		words = nouns.merge(adj)
		#Removes some meaningless words as keys. didn't remove them earlier because I imagine they could potentially still be useful in noun phrases
		words = words.except("beer", "brew", "flavor", "first", "character", "finish", "color", "style", "taste", "aroma", "aromas", "brewery")
		#Exclude words with count of 2 (for now) or fewer
		valid_keys = []
		words.each do |k,v| 
			if v > 2
				valid_keys.push(k)
			end	
		end
		words.slice!(*valid_keys)
		#Converts hash into array and sorts with highest value first
		words_array = words.sort {|k,v| v[1]<=>k[1]}
		
		#return "#{words[0][0]}, #{words[1][0]}, #{words[2][0]}"
	end


	private

	def user_params
      	params.require(:user).permit(:first_name)
    end

end