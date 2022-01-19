class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundsSerializer.new(BackgroundsFacade.new(params[:location]))
  end
end
