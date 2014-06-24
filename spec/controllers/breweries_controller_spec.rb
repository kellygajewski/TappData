require 'spec_helper'

describe BreweriesController do
	describe "GET 'index'" do

		it 'should render index template' do
			get :index
			expect(response).to render_template :index
		end

		it "should succeed" do
    		expect(response).to be_success
    	end

    	# it "should assign all breweries to be breweries" do
     #  		expect(assigns(:breweries)).to include(brewery)
    	# end

    end

    describe 'Untappd queries' do
    	
    end
end
