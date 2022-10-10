# frozen_string_literal: true

require './lib/tax_amount'
require './lib/tax_rules'
require './lib/imported_good_tax_rule'
require './lib/basic_sales_tax_rule'
require './lib/item'
require './lib/constants'

# spec/tax_amount_spec.rb
describe TaxAmount do
  before do
    @imported_item = Item.new('box of imported books', '1', '24.50')
    @non_imported_item = Item.new('box of perfume', '2', '24.50')
    @nearest_cofactor = Constants::ROUNDING_UP_FACTOR
  end

  describe '#applicable_taxes' do
    it 'should return the applicable tax names for the product' do
      TaxRules.rules.clear
      TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
      TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))
      expect(TaxAmount.applicable_taxes(@non_imported_item)).to eql([BasicSalesTaxRule])
      expect(TaxAmount.applicable_taxes(@imported_item)).to eql([ImportedGoodTaxRule])
    end
  end

  describe '#tax_for' do
    it 'should return the tax amount for a single product' do
      TaxRules.rules.clear
      TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
      TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))
      expect(TaxAmount.tax_for(@imported_item).round(2)).to eql(1.23)
      expect(TaxAmount.tax_for(@non_imported_item).round(2)).to eql(2.45)
    end
  end

  describe '#base_tax' do
    it 'should return the base tax for the product(s) in the cart' do
      TaxRules.rules.clear
      TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
      TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))
      expect(TaxAmount.base_tax(@imported_item).round(2)).to eql(1.23)
      expect(TaxAmount.base_tax(@non_imported_item).round(2)).to eql(4.9)
    end
  end

  describe '#price_amount' do
    it 'should calculate total price for the product(s)' do
      expect(TaxAmount.price_amount(@imported_item).round(2)).to eql(24.50)
      expect(TaxAmount.price_amount(@non_imported_item).round(2)).to eql(49.0)
    end
  end

  describe '#taxes_amount' do
    it 'should calculate total tax for the product(s)' do
      TaxRules.rules.clear
      TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
      TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))
      expect(TaxAmount.taxes_amount(@imported_item).round(2)).to eql(1.25)
      expect(TaxAmount.taxes_amount(@non_imported_item).round(2)).to eql(4.9)
    end
  end

  describe '#rounding_to_factor' do
    it 'should round to the specified cofactor' do
      expect(TaxAmount.rounding_to_factor).to eql(@nearest_cofactor)
    end
  end
end
