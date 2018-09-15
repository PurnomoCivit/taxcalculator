class UserController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /user
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /user
  def create
    @users = User.create!(user_params)
    json_response(@users, :created)
  end

  # GET /user/:id
  def show
    json_response(@users)
  end

  # PUT /user/:id 
  def update
    if user_params.empty?
      head :no_content
    else
      @users.update(user_params)
      json_response(@users)
    end
  end

  # DELETE /user/:id
  def destroy
    if params[:id].empty?
      head :no_content
    else
      @users.destroy
      json_response(["User ID = "+params[:id]+" has been deleted"])
    end
  end

  private

  def user_params
    # whitelist params
    params.permit(:name, :email, :hp)
  end

  def set_user
    @users = User.find(params[:id])
  end
end
