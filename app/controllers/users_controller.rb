class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Account created!"
      redirect_to root_path
    else
      flash[:alert] = "Account wasn't created!"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    #if current_user.update_attributes(user_params)
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path
      flash[:notice] = "Profile update successfully!"
    else
      flash[:alert] = "Profile not updated"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                  :password, :password_confirmation, :handicap,
                                  :age, :phone_number, :description, :user_image,
                                  :min_handicap, :max_handicap)
  end

end
