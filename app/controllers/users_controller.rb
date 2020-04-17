class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @events=Event.where(admin_id: current_user.id)
  end

  def edit
    @user=User.find(current_user.id)
  end

  def update
    @user=User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end 
  end

  private 
  def user_params
    user_params=params.require(:user).permit(:first_name, :last_name, :description)
  end
end
