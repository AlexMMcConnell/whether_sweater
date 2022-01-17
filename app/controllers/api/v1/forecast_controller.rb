class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.find(params[:location]))
  end
end
