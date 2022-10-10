# frozen_string_literal: true

require './lib/tax_rules'
require './lib/imported_good_tax_rule'
require './lib/basic_sales_tax_rule'

# spec/tax_rules_spec.rb
describe TaxRules do
  before do
    TaxRules.rules.clear
  end

  describe '#add_rules' do
    it 'should add the rule to @rules' do
      TaxRules.add_rules(Object.const_get('ImportedGoodTaxRule'))
      TaxRules.add_rules(Object.const_get('BasicSalesTaxRule'))
      expect(TaxRules.rules.size).to eql(2)
      expect(TaxRules.rules).to eql([ImportedGoodTaxRule, BasicSalesTaxRule])
    end
  end
end
