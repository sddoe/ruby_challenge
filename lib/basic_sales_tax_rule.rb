require './lib/constants'

#module to check elegibility to apply basic sales tax
module BasicSalesTaxRule
  class << self
    def apply_to?(item)
      !item.tax_exemption?
    end

    def tax_amount(item)
      item.price * tax_rate
    end

    def tax_rate
      Constants::BASIC_SALES_TAX
    end
  end  
end
