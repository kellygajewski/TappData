def main_style
	if beer.beer_style.include? "Porter"
		return "Porter"
	elsif beer.beer_style.include? "Stout"
		return "Stout"
	elsif beer.beer_style.include? "Belgian"
		return "Belgian Ale" 
	elsif (beer.beer_style.include? "Pale" ||  beer.beer_style.include? "Amber"&& beer.beer_style.include? "Ale") ||  beer.beer_style.include? "IPA" ||  beer.beer_style.include? "Barleywine"
		return "Pale Ale" ||  beer.beer_style.include? "IPA"
	elsif beer.beer_style.include? "Belgian" ||  beer.beer_style.include? "Saison" ||  beer.beer_style.include? "Witbier"
		return "Belgian Ale"
end
