class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end

  def create
    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

