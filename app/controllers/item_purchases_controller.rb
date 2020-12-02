class ItemPurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_form = PpurchaseForm.new(item_purchase_params)   #「UserDonation」に編集
    if @user_donation.valid?
      @user_donation.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def item_purchase_params
    params.require(:item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

end
