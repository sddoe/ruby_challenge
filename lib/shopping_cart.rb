#class to save the shopping cart items, total taxes and price
class ShoppingCart
  attr_accessor :items, :total_price, :total_tax

  def initialize
    @items = Array.new  
  end

  def add(item)
    @items.push(item)
    self
  end
end
