require 'rubygems'
require 'engtagger'

class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :checkins
	belongs_to :style

	def top_words
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
end
