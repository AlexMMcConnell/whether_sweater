class Api::V1::UsersController < ApplicationController
  def index
    new_user = request.POST
    user = User.new(email: new_user[:email], password: new_user[:password], api_key: ApiKey.new_key)

    if user.save && response[:password] == response[:password_confirmation]
      render json: UserSerializer.new(User.find(user[:id])), status: 201
    elsif response[:password] != response[:password_confirmation]
      render json: "Passwords do not match", status: 400
    elsif response[:email].nil?
      render json: "Email required to register", status: 400
    else
      render json: "User already exists", status: 409
    end
  end
end
