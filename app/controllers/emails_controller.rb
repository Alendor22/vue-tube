class EmailsController < ApplicationController
  before_action :set_user #, only: [:new, :index, :create, :update :show]
  before_action :set_email, only: [:show]
  
  def index
  end

  def new
    @email = current_user.sent_emails.build
  end

  def show
  end

  def create
    @email = current_user.sent_emails.build(email_params)

      #binding.pry
      if @email.valid? 
        @email.save
        redirect_to  user_emails_path(current_user)
      else
        render :new
      end
  end

  def edit
    set_email
  end

  def update
    set_email
    @email.update(email_params)
    redirect_to user_emails_path(current_user.id)
  end

  def destroy
    set_email
    @email.destroy(email_params)
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

  def set_email
    @email = Email.find_by_id(params[:id])
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

end