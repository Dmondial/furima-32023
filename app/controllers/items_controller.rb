class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      render '/items/new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.new
  end

  def update
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render '/items/new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :send_time_id, :image).merge(user_id: current_user.id)
  end
end
