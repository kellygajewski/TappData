class Checkin < ActiveRecord::Base
	belongs_to :beer
	belongs_to :user

	
    

	#(Hopefully) creates 2D array of the number of checkins per each beer style (columns) per month (rows). Next step is to convert each element into an object where each x is the column index and each y is the number of checkins per month ie {x: 0, y: 23} and this can then be fed into the D3 stacked bar chart.
	# def calc_beer_months(@month_counts)
	# 	@beer_months=Array.new(12)
	# 	styles=Array.new(@top_beer_styles.length)
	# 	styles.map! { |x| x = 0}
	# 	@beer_months.map! {|x| x = 0}

	#     for month in 0...12
	#       for month_beer in 0...@month_counts[h].length 
	#         for b_style in 0...@top_beer_styles.length
	#           if (month_beer == b_style)  
	#             @beer_months[month_beer][b_style]+=1
	#           end
	#         end
	#       end
	# 	end

	# end
	# push all month counts into array
	# iterate through each subarray and compare each element to array of styles (iterate through array of styles)
	# increment beer_months_array[month][style]
end
