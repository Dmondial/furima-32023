class ItemPurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(item_purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to items_path
    else
      render action: :index, collection: @item = Item.find(params[:item_id])
    end
  end

  private
  def item_purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

end
