class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = Product.where("user_id = #{current_user.id}")
    @destination = Destination.find_by(user_id: current_user.id)
  end


  

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の更新が完了しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_user_path(current_user.id)
    end
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

