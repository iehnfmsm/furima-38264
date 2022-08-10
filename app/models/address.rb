class Address < ApplicationRecord

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "（3桁）-（4桁）で記入してください"}
    validates :shikuchouson, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :banchi, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :phone_num, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "ハイフンなし半角数字で記入してください"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を選択してください" }

  belongs_to :order
end
