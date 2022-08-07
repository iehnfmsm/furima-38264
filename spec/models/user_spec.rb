require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "すべての項目が記入されている" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "ニックネームが必須" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスの一意性" do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@が含まれる" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが必須" do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが５字以下" do
        @user.password = "111aa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが129字以上" do
        @user.password = Faker::Internet.password(min_length:129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "パスワードが英字と数字の組み合わせでない" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワード確認がパスワードと一致しない" do
        @user.password = "111aaa"
        @user.password_confirmation = "123aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が必須" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "苗字が半角" do
        @user.last_name = "Shio"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "名前が必須" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が半角" do
        @user.first_name = "Tom"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "苗字(カナ)が必須" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "苗字(カナ)が半角" do
        @user.last_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
      end
      it "名前(カナ)が必須" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名前(カナ)が半角" do
        @user.first_name_kana = "ｺｳﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it "誕生日が必須" do
        @user.birthday = "2000-5-"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "誕生月が必須" do
        @user.birthday = "2000--12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "誕生年が必須" do
        @user.birthday = "-5-29"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      

    end

  end
end
