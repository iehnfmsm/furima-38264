class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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
    params.require(:item).permit(:title, :introduction, :price, :category_id, :status_id, :prefecture_id, :delivery_charge_id,
                                 :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def user_check
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
