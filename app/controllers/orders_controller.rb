class OrdersController < ApplicationController

  before_action :put_item, only: [:index, :create]

  def index
    if user_signed_in?
      if current_user.id == @item.id
        redirect_to root_path
      else
        if Order.exists?(item_id: @item.id)
          redirect_to root_path
        else
          @order_address = OrderAddress.new
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def put_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

