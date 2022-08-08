require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品成功' do
      it "すべての項目が入力されている" do
        expect(@item).to be_valid
      end
    end
    context '商品出品失敗' do
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
      it "" do
      end
    end
  end

end
