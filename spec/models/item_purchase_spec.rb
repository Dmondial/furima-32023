require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '正しく入力されていればできる' do
        expect(@item_purchase).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureが0だと登録できない' do
        @item_purchase.prefecture_id = 0
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと登録できない' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字以外だと登録できない' do
        @item_purchase.postal_code = '一二三四五六七八九十零'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
