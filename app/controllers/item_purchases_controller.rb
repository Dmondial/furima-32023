class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index , only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(item_purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to items_path
    else
      render action: :index, collection: @item = Item.find(params[:item_id])
    end
  end

  private
  def item_purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def move_to_index
    item_user = Item.find(params[:item_id]) 
    if item_user.user_id == current_user.id
      redirect_to items_path
    end
  end

end
