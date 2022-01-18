class Api::V1::BooksController < ApplicationController
  def index
    render json: BookSerializer.new(BookFacade.new(params[:location], params[:quantity]))
  end
end
