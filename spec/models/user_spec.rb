require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,encrypted_password,全角の苗字と名前,全角の苗字と名前のカナ,生年月日があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下なら登録できない' do
        @user.password = '000a0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角数字のみなら登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが半角英字のみなら登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it '確認用パスワードが入っていないなら登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の苗字が入っていなければ登録できない' do
        @user.kanji_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji family name can't be blank", 'Kanji family name is invalid')
      end
      it 'ユーザー本名の名前が入っていなければ登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank", 'Kanji first name is invalid')
      end
      it 'ユーザー本名の苗字の振り仮名が入っていなければ登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank", 'Kana family name is invalid')
      end
      it 'ユーザー本名の名前の振り仮名が入っていなければ登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", 'Kana first name is invalid')
      end
      it 'ユーザー本名の苗字が漢字・平仮名・カタカナでないなら登録できない' do
        @user.kanji_family_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji family name is invalid')
      end
      it 'ユーザー本名の名前が漢字・平仮名・カタカナでないなら登録できない' do
        @user.kanji_first_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name is invalid')
      end
      it 'ユーザー本名の苗字の振り仮名がカタカナでないなら登録できない' do
        @user.kana_family_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid')
      end
      it 'ユーザー本名の名前の振り仮名カタカナでないなら登録できない' do
        @user.kana_first_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it '生年月日が入っていないなら登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
