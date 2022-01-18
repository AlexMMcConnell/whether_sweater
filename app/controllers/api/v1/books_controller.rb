class Api::V1::BooksController < ApplicationController
  def index
    if params[:location].present? && params[:quantity].present?
      render json: BookSerializer.new(BookFacade.new(params[:location], params[:quantity]))
    else
      render json: "Please include a location and quantity", status: 400
    end
  end
end
