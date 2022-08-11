require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    order = FactoryBot.create(:order)
    @order_address = FactoryBot.build(:order_address, user_id: order.user_id, item_id: order.item_id)
    sleep 0.1
  end

  describe "" do
    context "正しく購入できる場合" do
      it "すべての欄が記入されている" do
        expect(@order_address).to be_valid
      end
      it "建物情報のみ未記入" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end
    context "購入できない場合" do
      it "郵便番号が未記入" do
        @order_address.zip = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end
      it "郵便番号がハイフン無し" do
        @order_address.zip = "2450002"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip （3桁）-（4桁）半角数字で記入してください")
      end
      it "郵便番号が全角である" do
        @order_address.zip = "２４５−０００２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip （3桁）-（4桁）半角数字で記入してください")
      end
      it "都道府県を選択していない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture 都道府県を選択してください")
      end
      it "市区町村が未記入" do
        @order_address.shikuchouson = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shikuchouson can't be blank")
      end
      it "番地が未記入" do
        @order_address.banchi = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Banchi can't be blank")
      end
      it "電話番号が未記入" do
        @order_address.phone_num = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it "電話番号がハイフンあり" do
        @order_address.phone_num = "090-0909-0909"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num ハイフンなし半角数字(１０桁又は１１桁)で記入してください")
      end
      it "電話番号の桁数が多い" do
        @order_address.phone_num = "090909090909"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num ハイフンなし半角数字(１０桁又は１１桁)で記入してください")
      end
      it "電話番号が全角入力" do
        @order_address.phone_num = "０９０９０９０９０９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num ハイフンなし半角数字(１０桁又は１１桁)で記入してください")
      end
      it "userと結びついていない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemと結びついていない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "トークンが空の時" do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end