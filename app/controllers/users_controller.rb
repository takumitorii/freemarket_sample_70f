class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end

  def destination_params
    params.require(:destination).permit(
      :family_name,
      :family_name_kana,
      :first_name,
      :first_name_kana,
      :post_code,
      :prefecture,
      :city, :adress,
      :building_name,
      :phone_number, :user_id
    )
  end
end
