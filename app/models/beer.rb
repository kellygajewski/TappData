# require 'rubygems'
# require 'engtagger'

class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :checkins
	belongs_to :style

	#Should return the top 3 nouns, noun phrases, or adjectives per description sample using the Engtagger gem
	# def top_words
	# 	tgr = EngTagger.new
	# 	# self.each do |b|
	# 	# 	desc_array.push(b.beer_description)
	# 	# end
	# 	# desc_string = desc_array.join(" ")
	# 	desc_string = "hops hops hops coffee coffee beer yum yum yum"
	# 	tagged = tgr.add_tags(desc_string)
	# 	nouns = tgr.get_words(tagged)
	# 	adj = tgr.get_adjectives(tagged)
	# 	words = nouns.merge(adj)
	# 	words.sort {|k,v| k[-1]<=>v[-1]}
	# 	return "#{words[0][0]}, #{words[1][0]}, #{words[2][0]}"
	# end

	#Should return the broader category for a beer given its beer_style
	def main_style
		if self.beer_style.include?("Porter")
			return "Porter"
		elsif self.beer_style.include?("Stout")
			return "Stout"
		elsif self.beer_style.include?("Brown Ale") || self.beer_style.include?("Dubbel")
			return "Brown Ale" 
		elsif ((self.beer_style.include?("Pale") || self.beer_style.include?("Amber") || self.beer_style.include?("Red") ||  self.beer_style.include?("Blonde") || self.beer_style.include?("Scottish")) && self.beer_style.include?("Ale")) || self.beer_style.include?("Belgian Blonde") || self.beer_style.include?("IPA") || self.beer_style.include?("Barleywine") || self.beer_style.include?("Bière de Garde") || self.beer_style.include?("Saison") || self.beer_style.include?("Bitter")
			return "Pale Ale" 
		elsif self.beer_style.include?("Hefeweizen") || self.beer_style.include?("Witbier")
			return "Wheat Beer"
		elsif self.beer_style.include?("Ale") || self.beer_style.include?("Altbier") || self.beer_style.include?("Quadrupel")
			return "Other Ale"
		elsif self.beer_style.include?("American Adjunct Lager") || self.beer_style.include?("American Light Lager")
			return "American Lager"
		elsif self.beer_style.include?("Lager") || self.beer_style.include?("bock") || self.beer_style.include?("Bock")
			return "Other Lager"
		elsif self.beer_style.include?("Pilsner")
			return "Pilsner"
		elsif self.beer_style.include?("Cider")
			return "Cider"
		else
			return "Other"
		end	
	end



end