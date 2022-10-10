# frozen_string_literal: true

require './lib/imported_good_tax_rule'
require './lib/item'
require './lib/constants'

# spec/imported_good_tax_rule_spec.rb
describe ImportedGoodTaxRule do
  before do
    @imported_item = Item.new('box of imported books', '1', '24.50')
    @non_imported_item = Item.new('box of perfume', '1', '24.50')
    @tax_rate = 0.05
    @import_tax_rate = Constants::IMPORTED_GOOD_TAX
  end

  describe '#apply_to?' do
    it 'should not apply this rule if item is not imported' do
      expect(ImportedGoodTaxRule.apply_to?(@non_imported_item)).to eql(false)
    end
    it 'should apply this rule if item is imported' do
      expect(ImportedGoodTaxRule.apply_to?(@imported_item)).to eql(true)
    end
  end

  describe '#tax_amount' do
    it 'should return the correct tax amount for the item' do
      expect(ImportedGoodTaxRule.tax_amount(@imported_item)).to eql(1.225)
    end
  end

  describe '#tax_rate' do
    it 'return the correct sales tax rate from constants.rb module' do
      expect(ImportedGoodTaxRule.tax_rate).to eql(@import_tax_rate)
    end
  end
end
