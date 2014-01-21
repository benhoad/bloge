class SetupController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_users

  def index
  end


  def create

    # Set up the first user
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to admin_posts_path
    else
      flash[:alert] = 'There was an error setting up this site. Please try again.'
      render :index
    end
  end


  private
    def check_users
      if User.any?
        redirect_to root_path
        return false
      end
    end


    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end