class Checkin < ActiveRecord::Base
	belongs_to :beer
	belongs_to :user

	top_beer_styles=["IPA", "American Light", "Porter", "Wheat", "Stout"]
    

	#(Hopefully) creates 2D array of the number of checkins per each beer style (columns) per month (rows). Next step is to convert each element into an object where each x is the column index and each y is the number of checkins per month ie {x: 0, y: 23} and this can then be fed into the D3 stacked bar chart.
	def calc_beer_months
		beer_months=Array.new(12)
		styles=Array.new(top_beer_styles.length)
		styles.map! { |x| x = 0}
		beer_months.map! {|x| x = 0}

	    for h in 0...@checkins.length
	      for i in 0...12 
	        for j in 0...top_beer_styles.length
	          if (@checkins[h].beer['beer_style'] === top_beer_styles[j] && @checkins[h]['checkinMonth'] === (i + 1)) 
	            beer_months[i][j]+=1
	          end
	        end
	      end
		end

	end
end
