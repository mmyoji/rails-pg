class Web::SessionsController < Web::BaseController
  before_action :authenticate_user!, only: :destroy

  # GET /login
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id.to_s
      redirect_to root_url, notice: "Welcome back!"
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new
    end
  end

  # DELETE /logout
  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: "Successfully logged out!"
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
