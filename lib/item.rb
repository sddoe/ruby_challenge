require './lib/constants'
require 'yaml'

#class to save items name, quantity, price and whether it is imported or not
class Item
  attr_accessor :quantity, :price, :name, :tax

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity.to_i
    @price = price.to_f
  end

  def imported_good?
    !!(@name =~ /imported/)
  end

  def tax_exemption?
    exemptions.any? { |name| @name =~ /#{name}/ }
  end

  def exemptions
    @exemptions ||= YAML.load File.open(Constants::EXEMPTION_ITEMS)
  end
end
