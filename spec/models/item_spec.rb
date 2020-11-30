require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '新規商品出品がうまくいくとき' do
      it 'image、name、introduction、category、condition、delivery_fee、send_source、send_time、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it 'delivery_feeが空だと登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it 'send_sourceが空では登録できない' do
        @item.send_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send source Select")
      end
      it 'send_timeが空だと登録できない' do
        @item.send_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send time Select")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end


end
