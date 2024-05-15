require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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
        expect(@item.errors.full_messages).to include '画像を入力してください'
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it 'category_idが---では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを選択してください。'
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '状態を選択してください。'
      end
      it 'shipping_cost_idが---では登録できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料を選択してください。'
      end
      it 'prefecture_idが---では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送元の地域を選択してください。'
      end
      it 'shipping_day_idが---では登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送までの日数を選択してください。'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '金額を入力してください'
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '１あa b'
        @item.valid?
        expect(@item.errors.full_messages).to include '金額は数値で入力してください'
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '1.1'
        @item.valid?
        expect(@item.errors.full_messages).to include '金額は整数で入力してください'
      end

      it 'priceが300円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '金額は300以上の値にしてください'
      end
      it 'priceが9999999円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '金額は9999999以下の値にしてください'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
