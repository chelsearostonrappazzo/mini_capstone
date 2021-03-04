class Product < ApplicationRecord
  validates :name, :price, :image_url, :description, :quantity, presence: true
  validates :description, length: { in: 20..500 }
  validates :name, uniqueness: { message: "That product already exists!" }
  validates :price, :quantity, numericality: { greater_than: 0 }

  def is_discounted?
    price < 300.00
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
