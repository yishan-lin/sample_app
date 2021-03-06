class UsersController < ApplicationController
 def new
  end

  def old
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save #returns a true or false depending on if they pass the required parameters
      flash[:success] = "Great! Welcome onboard!"
      redirect_to @user
      #do_something
    else
      render 'new'
      #render @user.errors.full_messages
    end

end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :comment)
    end


end
