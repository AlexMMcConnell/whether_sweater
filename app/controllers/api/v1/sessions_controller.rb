class Api::V1::SessionsController < ApplicationController
  def index
    current_user = request.POST
    user = User.find_by(email: current_user[:email])
    if user && (current_user[:password] == user[:password])
      render json: UserSerializer.new(user)
    else
      render json: "Invalid credentials", status: 400
    end
  end
end
