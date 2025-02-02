class SessionsController < ApplicationController
  def create
    # byebug
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: "Invalid Credentials", status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
  end
end
