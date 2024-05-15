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
        expect(@order_address.errors.full_messages).to include '郵便番号を入力してください'
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234５67'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は無効です。次のように入力してください（例 123-4567）')
      end

      it 'prefecture_idが---では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '配送元の地域を選択してください。'
      end

      it 'municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '市町村を入力してください'
      end

      it 'street_addressが空では登録できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '番地を入力してください'
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号を入力してください'
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @order_address.phone_number = '１あa^-b'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は不正な値です。数字のみを入力してください。'
      end

      it 'phone_numberが10文字以下では登録できない' do
        @order_address.phone_number = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は短すぎます'
      end


      it 'phone_numberが12文字以上では登録できない' do
        @order_address.phone_number = '1234567891234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は長すぎます'
      end 

      it 'ユーザーが紐付いていなければ投稿できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Userを入力してください'
      end

      it 'itemが紐付いていなければ投稿できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Itemを入力してください'
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'クレジットカード情報を入力してください'
      end
      end
    end
  end

