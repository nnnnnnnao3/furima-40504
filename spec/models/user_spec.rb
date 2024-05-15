require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end

      it 'password_confirmationdだけが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは英字と数字両方を含む設定が必要です。'
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは英字と数字両方を含む設定が必要です。'
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '654321'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end

      it 'お名前(姓)(全角)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字を入力してください'
      end
      it 'お名前(姓)(全角)が全角以外では登録できない' do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字は無効です。全角文字を入力してください。'
      end

      it 'お名前(名)(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前を入力してください'
      end

      it 'お名前(名)(全角)が全角以外では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は無効です。全角文字を入力してください。'
      end

      it 'お名前カナ(姓)(全角)が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'カナ姓を入力してください'
      end

      it 'お名前カナ(姓)(全角)が全角以外では登録できない' do
        @user.kana_last_name = 'たro宇'
        @user.valid?
        expect(@user.errors.full_messages).to include 'カナ姓は無効です。全角カタカナを入力してください。'
      end

      it 'お名前カナ(名)(全角)が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'カナ名を入力してください'
      end

      it 'お名前カナ(名)(全角)が全角以外では登録できない' do
        @user.kana_first_name = 'たro宇'
        @user.valid?
        expect(@user.errors.full_messages).to include 'カナ名は無効です。全角カタカナを入力してください。'
      end

      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '誕生日を入力してください'
      end
    end
  end
end
