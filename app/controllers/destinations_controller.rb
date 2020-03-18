class DestinationsController < ApplicationController

  def new
    @destination = Destination.new
  end

  def create
    
    @destination = Destination.new(destination_params)
    @destination.save!
    flash[:notice] = "配送情報の登録が完了しました！"
    redirect_to user_path(current_user.id)
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    @destination.save!
    flash[:notice] = "配送情報の更新が完了しました！"
    redirect_to user_path(current_user.id)
  end


  private
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
      :phone_number
    ).merge(user_id: current_user.id)
  end


end
