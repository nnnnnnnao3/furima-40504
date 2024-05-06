require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
    end


  describe '商品出品機能' do

    context '商品出品できるとき' do
    it 'imageとitem_name、category_id、condition_id、shipping_cost_id、prefecture_id、shipping_day_id、priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

    context '商品出品できないとき' do
    it 'imageが空では登録できない' do
      @item.image = @item.image.detach
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it 'category_idが---では登録できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが---では登録できない' do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'shipping_cost_idが---では登録できない' do
      @item.shipping_cost_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
    end
    it 'prefecture_idが---では登録できない' do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'shipping_day_idが---では登録できない' do
      @item.shipping_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが半角数字以外では登録できない' do
      @item.price = '１あa b'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it 'priceが半角数字以外では登録できない' do
      @item.price = '1.1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be an integer'
    end

    it 'priceが300円以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end
    it 'priceが9999999円以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end  
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end
