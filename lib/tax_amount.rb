# frozen_string_literal: true

require './lib/constants'

# class for calculating the tax amount for the selected shopping cart
class TaxAmount
  class << self
    def applicable_taxes(item)
      applicable_rules ||= []
      TaxRules.rules.each do |t|
        applicable_rules << t if t.apply_to? item
      end
      applicable_rules
    end

    def tax_for(item)
      taxes = applicable_taxes(item).map { |s| s.tax_amount item }
      taxes.inject(0) { |r, element| r + element }
    end

    def base_tax(item)
      (item.quantity * tax_for(item))
    end

    def tax(item)
      rounding_factor = 1 / rounding_to_factor
      (rounding_factor * base_tax(item)).ceil / rounding_factor
    end

    def price_amount(item)
      item.quantity * item.price
    end

    def taxes_amount(item)
      tax(item)
    end

    def rounding_to_factor
      Constants::ROUNDING_UP_FACTOR
    end
  end
end
