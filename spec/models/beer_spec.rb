#require 'spec_helper'
require 'rails_helper'

RSpec.describe Beer, :type => :model do
#describe Beer do
  
	before do
		@beer = Beer.create!(beer_name: "Shock Top", beer_style: "Witbier")
	end

  	it 'returns the correct main_style' do
  		expect(@beer.main_style).to eql("Wheat Beer")
  	end

end
