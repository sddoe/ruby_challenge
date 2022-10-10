# frozen_string_literal: true

require './lib/basic_sales_tax_rule'
require './lib/item'
require './lib/constants'

# spec/basic_sales_tax_rule_spec.rb
describe BasicSalesTaxRule do
  before do
    @exempt_item = Item.new('box of imported books', '1', '24.50')
    @non_exempt_item = Item.new('box of perfume', '1', '24.50')
    @tax_rate = 0.10
    @sales_tax_rate = Constants::BASIC_SALES_TAX
  end

  describe '#apply_to?' do
    it 'should not apply this rule if there is a matching exemption' do
      expect(BasicSalesTaxRule.apply_to?(@exempt_item)).to eql(false)
    end

    it 'should apply this rule if there is no matching exemption' do
      expect(BasicSalesTaxRule.apply_to?(@non_exempt_item)).to eql(true)
    end
  end

  describe '#tax_amount' do
    it 'should return the correct tax amount for the item' do
      expect(BasicSalesTaxRule.tax_amount(@non_exempt_item)).to eql(2.45)
    end
  end

  describe '#tax_rate' do
    it 'should return the correct sales tax rate form constants.rb module' do
      expect(BasicSalesTaxRule.tax_rate).to eql(@sales_tax_rate)
    end
  end
end
