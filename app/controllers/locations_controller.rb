class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @location = Location.new
  end

  # POST /locations
  # POST /locations.json
  def create
    @shops = []
    @location = Location.create(location_params)
    @client = GooglePlaces::Client.new('AIzaSyAoyYLaKjjiGU7w0PLc-7l7zyuEqYWUYvI')
    @shops = @client.spots_by_query('coffee near ' + @location.address)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:address)
    end
end
