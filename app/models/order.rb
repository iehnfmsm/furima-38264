class Order < ApplicationRecord

  validates :user_id, null: false
  validates :item_id, null: false


  belongs_to :user
  belongs_to :item
  has_one :address
end
