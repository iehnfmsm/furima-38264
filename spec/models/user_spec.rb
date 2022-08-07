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
      end
      it "メールアドレスに@が含まれる" do
      end
      it "パスワードが必須" do
        @user.password = ""
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが５字以下" do
      end
      it "パスワードが英字と数字の組み合わせでない" do
      end
      it "パスワード確認がパスワードと一致しない" do
      end
      it "苗字が必須" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "苗字が半角" do

      end
      it "名前が必須" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が半角" do
      end
      it "苗字(カナ)が必須" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "苗字(カナ)が半角" do
      end
      it "名前(カナ)が必須" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名前(カナ)が半角" do

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
