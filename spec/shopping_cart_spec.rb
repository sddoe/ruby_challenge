# frozen_string_literal: true

require './lib/shopping_cart'
require './lib/item'

# spec/shopping_cart_spec.rb
describe ShoppingCart do
  before do
    @item1 = Item.new('book', 1, 12.03)
    @item2 = Item.new('perfume', 2, 10.39)
    @total_price = 20.05
    @total_tax = 4.08
    @cart = ShoppingCart.new
    @cart.total_price = @total_price
    @cart.total_tax = @total_tax
  end

  describe '#get_attr_accessor' do
    it 'should get the items' do
      @cart.items = [@item1, @item2]
      expect(@cart.items).to eql([@item1, @item2])
    end

    it 'should get the total price for the cart' do
      expect(@cart.total_price).to eql(@total_price)
    end

    it 'should get the total tax for the cart' do
      expect(@cart.total_tax).to eql(@total_tax)
    end
  end

  describe '#add' do
    it 'should add new item to the cart' do
      @cart.add(@item1)
      @cart.add(@item2)
      expect(@cart.items).to eql([@item1, @item2])
    end
  end
end
