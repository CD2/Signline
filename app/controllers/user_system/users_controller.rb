class UserSystem::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include Permissions
  before_action :require_logged_in, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:show, :edit, :update]

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email current_site
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    def require_same_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user? @user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
