class LineItem < ActiveRecord::Base
  attr_accessible :product_id, :cart_id, :quantity, :price
  belongs_to :product
  belongs_to :cart
  
  
  def total_price
    product.price * quantity
  end
  
  def decrement_quantity!
    if quantity > 1
      self.quantity = self.quantity - 1
      save
    else
      self.destroy
    end
  end
  
  def increase_quantity!
    self.quantity = self.quantity + 1
    save
  end
end
