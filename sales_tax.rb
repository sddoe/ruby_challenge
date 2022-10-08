# frozen_string_literal: true

require './lib/shopping_cart'
require './lib/input'
require './lib/item'
require './lib/tax_rules'
require './lib/basic_sales_tax_rule'
require './lib/imported_good_tax_rule'
require './lib/tax_amount'
require './lib/receipt'

# create a new empty shopping cart and total taxes and price at 0
file_name = ARGV[0]
total_price = 0
total_tax = 0
cart = ShoppingCart.new

# add the imported good rules and basic sales tax rules to TaxRules
TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))

# create the items and add them to the shopping cart
File.open(file_name, 'r') do |infile|
  while (line = infile.gets)
    element = Input.parse(line)
    item = Item.new(element[:name], element[:quantity], element[:price])
    cart.add(item)
  end

  # calculate taxes for each item of the shopping cart
  cart.items.each do |i|
    total_price += TaxAmount.price_amount(i)
    i.tax = (TaxAmount.taxes_amount(i))
    total_tax += i.tax
  end

  # calculate the total price and total taxes fir the shopping cart and print the receipt
  cart.total_price = total_price
  cart.total_tax = total_tax
  receipt = Receipt.new(cart.clone)
  receipt.print_items
  receipt.print_total
end
