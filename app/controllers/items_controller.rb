class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render "/items/new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :condition_id, :delivery_fee_id, :send_source_id, :send_time_id, :image).merge(user_id: current_user.id)
  end

end
