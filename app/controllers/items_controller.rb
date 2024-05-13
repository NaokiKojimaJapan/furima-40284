class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_item, only: [:create, :show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end
end
