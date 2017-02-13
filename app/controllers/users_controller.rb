  class UsersController < ApplicationController
  

  def show
   @user = User.find(params[:id])

	end

	def new
		 @user = User.new
  end

   def create
    puts("IDI V HUJ!!!!!!!!!!!!!!!!!!!!!!!!")
   @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save.
       @user.send_activation_email
      
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
