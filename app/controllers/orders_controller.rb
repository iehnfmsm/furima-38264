class OrdersController < ApplicationController

  def index
    @order = Order.new(order_params)
  end


  private

  def order_params
    params.permit(:zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

end

