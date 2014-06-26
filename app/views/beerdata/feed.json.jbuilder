json.beers do
  @top_beer_styles.each do |b| 
  	json.set! "x", b
  end
end