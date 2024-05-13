class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_user, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
