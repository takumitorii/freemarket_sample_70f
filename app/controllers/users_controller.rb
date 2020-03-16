class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save!
    redirect_to user_path(current_user.id)
  end

  def destroy
    
  end

  private
  def user_params
    params.require(:user).permit(
      :family_name,
      :family_name_kana,
      :first_name,
      :first_name_kana,
      :nickname,
      :introduction,
      :user_image, :email,
      :birth_day,
      :encrypted_password
    )
  end
end
