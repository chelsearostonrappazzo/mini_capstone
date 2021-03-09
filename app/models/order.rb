class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true

  def subtotal
    product.price * quantity
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + total
  end
end
