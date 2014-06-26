json.array!(@beerdata) do |beerdata|
  json.extract! beerdata, @beer_months
  json.url beerdata_url(beerdata, format: :json)
end