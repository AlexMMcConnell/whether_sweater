class Api::V1::BackgroundsController < ApplicationController
  def index
    BackgroundsSerializer.new(BackgroundsFacade.new(params[:location]))
  end
end
