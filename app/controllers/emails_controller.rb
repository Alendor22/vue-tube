class EmailsController < ApplicationController
  before_action :set_user #, only: [:new, :index, :create, :update :show]
  before_action :set_email, only: [:show]
  
  # implied render index action
  def index
  end

  # new form action
  def new
    @email = current_user.sent_emails.build
  end

  # implicit render show action
  def show
  end

  # explicit render create email action
  def create
    @email = current_user.sent_emails.build(email_params)

      if @email.valid? 
        @email.save
        redirect_to  user_emails_path(current_user)
      else
        render :new
      end
  end

  # edit form action
  def edit
    set_email
  end

  # explicit render update action
  def update
    set_email
    @email.update(email_params)
    redirect_to user_emails_path(current_user.id)
  end

  # explicit render destroy action
  def destroy
    set_email.destroy
    flash[:notice] = "Email Deleted!"
    redirect_to user_emails_path(current_user.id)
  end

  private 

  def user_params
    params.require(:user).permit(:name)
  end

  def email_params
    params.require(:email).permit(:receiver_id, :subject, :content, :read)
  end

  # helper
  def set_email
    @email = Email.find_by_id(params[:id])
  end

  # helper
  def set_user
    @user = User.find_by_id(params[:user_id])
  end

end