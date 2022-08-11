class OrdersController < ApplicationController

  before_action :put_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def put_item
    @item = Item.find(params[:item_id])
  end
end

