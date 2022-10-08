# frozen_string_literal: true

require './lib/constants'

# module to check elegibility to apply imported good tax
module ImportedGoodTaxRule
  class << self
    def apply_to?(item)
      item.imported_good?
    end

    def tax_amount(item)
      item.price * tax_rate
    end

    def tax_rate
      Constants::IMPORTED_GOOD_TAX
    end
  end
end
