# frozen_string_literal: true

require './lib/receipt'
require './lib/shopping_cart'
require './lib/item'
require './lib/tax_amount'
require './lib/tax_rules'

# spec/receipt_spec.rb
describe Receipt do
  before do
    @item1 = Item.new('book', 1, 12.03)
    @item2 = Item.new('perfume', 2, 10.39)
    total_price = 0
    total_tax = 0
    @cart = ShoppingCart.new
    @cart.items = [@item1, @item2]
    @cart.items.each do |i|
      total_price += TaxAmount.price_amount(i)
      i.tax = (TaxAmount.taxes_amount(i))
      total_tax += i.tax
    end
    @cart.total_price = total_price
    @cart.total_tax = total_tax
    @receipt = Receipt.new(@cart)
  end

  describe '#print_items' do
    it 'should print the items with all the details' do
      expect do
        @receipt.print_items
      end.to output("1 book: 12.03\n2 perfume: 20.78\n").to_stdout
    end
  end

  describe '#print_total' do
    it 'should print the totals including taxes' do
      expect do
        @receipt.print_total
      end.to output("Salex Taxes: 0.0\nTotal: 32.81\n").to_stdout
    end
  end
end
