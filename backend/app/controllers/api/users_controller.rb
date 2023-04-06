class Api::UsersController < ApplicationController
  before_action :authorize_request, except: %i[create]
  before_action :find_user, except: %i[create]

  def create
    @user = User.create!(user_params)
    if @user.valid?
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  def destroy
    @user.destroy
    render json: { message: "User deleted" }, status: :ok
  end

  private def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFoundz
    render json: { errors: "User not found" }, status: :not_found
  end

  private def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
