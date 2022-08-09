class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
end
