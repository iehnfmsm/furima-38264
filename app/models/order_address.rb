class OrderAddress
  include ActiveModel::Model
 
  attr_accessor :zip, :prefecture_id, :shikuchouson, :banchi, :building, :phone_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "（3桁）-（4桁）半角数字で記入してください"}
    validates :shikuchouson
    validates :banchi
    validates :phone_num, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "ハイフンなし半角数字(１０桁又は１１桁)で記入してください"}
    validates :user_id
    validates :item_id
    validates :token
  end
 
  validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を選択してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, shikuchouson: shikuchouson, banchi: banchi, phone_num: phone_num, order_id: order.id)
  end
 end