class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_data, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destory]
  

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render new_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :send_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id
      redirect_to items_path
    elsif @item.item_purchase.present?
      redirect_to items_path
    end
  end

  def item_data
    @item = Item.find(params[:id])
  end
end
