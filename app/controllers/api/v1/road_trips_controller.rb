class Api::V1::RoadTripsController < ApplicationController
  def index
    new_trip = request.POST

    if User.find_by(api_key: new_trip[:api_key])
      render json: RoadTripSerializer.new(RoadTripFacade.new(new_trip[:origin], new_trip[:destination]))
    else
      render json: "Unauthorized or invalid key.", status: 401
    end
  end
end
