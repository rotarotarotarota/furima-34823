require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録ができる時' do
      it "全ての項目に正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailには@が含まれているメールアドレスなら登録できる" do
        @user.email = "dd@ad"
        expect(@user).to be_valid
      end
      it "passwordは6文字以上で半角英数混合で、password_confirmationも同一なら登録できる" do
        @user.password = "abc456"
        @user.password_confirmation = "abc456"
        expect(@user).to be_valid
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）なら登録できる" do
        @user.last_name = "佐とウ"
        expect(@user).to be_valid
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）なら登録できる" do
        @user.first_name = "イち郎"
        expect(@user).to be_valid
      end
      it "kana_last_nameは全角（カタカナ）なら登録できる" do
        @user.kana_last_name = "サトウ"
        expect(@user).to be_valid
      end
      it "kana_first_nameは全角（カタカナ）なら登録できる" do
        @user.kana_first_name = "ケン"
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = "gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailは一意性でないと登録できない" do
        user = FactoryBot.create(:user)
        @user.email = user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end      
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは6文字未満だと登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc121"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは半角英字のみでは登録できない" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合での入力が必要。")
      end
      it "passwordは半角数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合での入力が必要。")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "ichirou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end      
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = "yamaguchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "kana_last_nameが空だと登録できない" do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it "kana_first_nameが空だと登録できない" do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "kana_last_nameは全角(カタカナ)でないと登録できない" do
        @user.kana_last_name = "やまぐち"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name は全角カタカナでの入力が必要。")
      end
      it "kana_first_nameは全角(カタカナ)でないと登録できない" do
        @user.kana_first_name = "ichirou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name は全角カタカナでの入力が必要。")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
