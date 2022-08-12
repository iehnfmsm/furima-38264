require 'rails_helper'

RSpec.describe Order, type: :model do
  association :user
  association :item
end
