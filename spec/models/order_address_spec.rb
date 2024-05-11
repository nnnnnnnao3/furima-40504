require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)

    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'post_codeとprefecture_id、municipality、street_address、phone_number,tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234５67'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_idが---では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'municipalityが空では登録できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street address can't be blank"
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @order_address.phone_number = '１あa^-b'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it 'phone_numberが10文字以下では登録できない' do
        @order_address.phone_number = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short'
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていなければ投稿できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
