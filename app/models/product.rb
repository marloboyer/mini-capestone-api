class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier

  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    product_tax = 0.09 * price
    return product_tax
  end

  def total
    product_total = price + tax
    return product_total
  end
end
