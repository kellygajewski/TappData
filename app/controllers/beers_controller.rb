# require 'rubygems'
# require 'engtagger'

class BeersController < ApplicationController

	def index
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
	    @response = Untappd::User.feed("Kelly310").checkins.items
	    r = 0
	    while r < @response.length
		    single_checkin = @response[r]
		    main_style(single_checkin)
		    r += 1
		end		

	end
		
end


