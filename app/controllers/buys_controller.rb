class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:index, :create]
  before_action :move_to_index

  def index
    @buy_transmit = BuyTransmit.new
  end

  def create
    @buy_transmit = BuyTransmit.new(buy_params)
    if @buy_transmit.valid?
      pay_item
      @buy_transmit.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.buy.present?
  end

  def buy_params
    params.require(:buy_transmit).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
