class Api::V1::UsersController < ApplicationController
  def index
    new_user = request.POST
    user = User.new(email: new_user[:email], password: new_user[:password], api_key: ApiKey.new_key)

    if user.save && new_user[:password] == new_user[:password_confirmation]
      render json: UserSerializer.new(User.find(user[:id])), status: 201
    elsif new_user[:password] != new_user[:password_confirmation]
      render json: "Passwords do not match", status: 400
    elsif new_user[:email].empty?
      render json: "Email required to register", status: 400
    else
      render json: "Email already registered", status: 409
    end
  end
end
