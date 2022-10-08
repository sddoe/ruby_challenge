# frozen_string_literal: true

# class to print the receipt for the cart
class Receipt
  def initialize(cart)
    @cart = cart
  end

  def print_items
    @cart.items.each do |item|
      quantity = item.quantity
      puts "#{quantity} #{item.name}: #{((item.price * quantity) + item.tax).round(2)}"
    end
  end

  def print_total
    total_tax = @cart.total_tax
    puts "Salex Taxes: #{total_tax.round(2)}"
    puts "Total: #{(@cart.total_price + total_tax).round(2)}"
  end
end
