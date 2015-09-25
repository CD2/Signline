class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_new, only: :new

  def index
    @users = User.all
  end

  # POST /users
  def create
    @object = User.new(user_params)

    if @object.save
      redirect_to admin_users_path
      flash[:notice] = 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to admin_users_path
      flash[:notice] = 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_path
    flash[:notice] = 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @object = @user
    end

    def set_new
      @object = User.new
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
end
