class Web::ResendConfirmationEmailsController < Web::BaseController
  before_action :authenticate_user!, only: %i(new create)

  # GET /resend_confirmation_email/new
  def new
  end

  # POST /resend_confirmation_email
  def create
    current_user.assign_confirmation_token
    current_user.save!
    UserMailer.with(user: current_user).confirm.deliver_later

    redirect_to root_url, notice: "Confirmation email is successfully sent and check it!"
  end
end
