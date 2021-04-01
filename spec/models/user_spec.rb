require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context "登録できるとき" do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが合致すれば登録できる" do
      expect(@user.password).to eq(@user.password_confirmation)
    end
  end
  context "登録できないとき" do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに＠を含めないとないと登録できない" do
      @user.email = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      # binding.pry
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_katakanaが空では登録できない" do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it "last_name_katakanaが空では登録できない" do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end

    it "ユーザー本名(first_name)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "ユーザー本名(last_name)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end


    it "first_name_katakanaが全角(カタカナ)でなければ登録できない" do
      @user.first_name_katakana = 'kあ阿'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
    end

    it "last_name_katakanaが全角(カタカナ)でなければ登録できない" do
      @user.last_name_katakana = 'kあ阿'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end      

    it "パスワードに半角英数字が混合されていれば登録ができる" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワードに半角英数字が混合されていれば登録ができる" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end
