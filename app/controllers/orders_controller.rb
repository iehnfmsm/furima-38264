class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id).merge(user_id: current_user.id)
  end

end

