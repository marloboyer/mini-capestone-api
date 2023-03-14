class Order < ApplicationRecord
  belongs_to :user
  blongs_to :products
end
