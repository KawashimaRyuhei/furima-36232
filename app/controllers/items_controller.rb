class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_fee_id, :shipment_day_id,
                                 :prefectures_id, :price).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless (current_user == @item.user) && @item.buy.blank?
  end
end
