class BreweriesController < ApplicationController
	def index
    @breweries = Brewery.all
    response = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/breweries.json")
    @name = response[0]["brewery_name"]
    @city = response[0]["brewery_city"]
    @state = response[0]["brewery_state"]
    @country = response[0]["country_name"]
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create
    @brewery = Brewery.new(brewery_params)
    response = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/breweries.json")

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to @brewery, notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end
  def untappd(brewnum)
    response = HTTParty.get("http://guarded-reaches-3146.herokuapp.com/breweries.json")
    @name = response[brewnum]["brewery_name"]
    @city = response[brewnum]["brewery_city"]
    @state = response[brewnum]["brewery_state"]
    @country = response[brewnum]["country_name"]
    def brewery_params
      params.require(:brewery).permit(:brewery_name, :brewery_city, :brewery_state)
    end
end

