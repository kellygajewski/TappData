json.array! (@response) do |beer|
  json.extract! beer
  json.url beer_url(beer, format: :json)
end
