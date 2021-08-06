class BuysController < ApplicationController
  def index
    @buy = Item.find(params[:item_id])
    @buy_transmit = BuyTransmit.new
  end

  def new
  end

  def create
    @buy_transmit = BuyTransmit.new(buy_params)
    if @buy_transmit.valid?
      @buy_transmit.save
      redirect_to root_path
    else
      @buy = Item.find(params[:item_id])
      render :index
    end
  end
    
  private

  def buy_params
    params.require(:buy_transmit).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
