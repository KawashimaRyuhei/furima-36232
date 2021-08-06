class BuysController < ApplicationController
  def index
    @buy = Item.find(params[:item_id])
    @buy_send = BuySend.new
  end

  def new
  end

  def create
    @buy_send = BuySend.new(buy_params)
    if @buy_send.valid?
      @buy_send.save
      redirect_to root_path
    else
      @buy = Item.find(params[:item_id])
      render :index
    end
  end
    
  private

  def buy_params
    params.require(:buy_send).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
