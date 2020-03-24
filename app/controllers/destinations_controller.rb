class DestinationsController < ApplicationController

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      flash[:notice] = "配送情報の登録が完了しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to new_destination_path
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      flash[:notice] = "配送情報の更新が完了しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_destination_path(@destination.id)
    end
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
      :city, :address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
  end


end
