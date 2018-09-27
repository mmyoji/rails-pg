class Web::UsersController < Web::BaseController
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to root_url, notice: "Your account is successfully created!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:username, :email, :password, :password_confirmation)
  end
end
