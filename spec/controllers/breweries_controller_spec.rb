require 'spec_helper'

describe BreweriesController do
	describe "GET 'index'" do

		it 'should render index template' do
			expect(response).to render_template :index
		end

		it "should succeed" do
    		expect(response).to be_success
    	end

    end
end
