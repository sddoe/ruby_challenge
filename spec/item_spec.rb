# frozen_string_literal: true

require './lib/item'

# spec/item_spec.rb
describe Item do
  before do
    @item = Item.new('box of books', '1', '24.50')
    @item.stub(:exemptions).and_return(%w[chocolate book pill])
  end

  describe '#initialize' do
    it 'returns the initialized item attributes' do
      expect(@item.name).to eql('box of books')
      expect(@item.quantity).to eql(1)
      expect(@item.price).to eql(24.50)
    end
  end

  describe '#imported_good?' do
    it 'should return false if item is not imported' do
      expect(@item.imported_good?).to eql(false)
    end
    it 'should return true if item is imported' do
      @item.name = 'box of imported books'
      expect(@item.imported_good?).to eql(true)
    end
  end

  describe '#tax_exemption?' do
    it 'should return true if item is exempt' do
      expect(@item.tax_exemption?).to eql(true)
    end
    it 'should return false if item is not exempt' do
      @item.name = 'box of perfume'
      expect(@item.tax_exemption?).to eql(false)
    end
  end

  describe '#exemptions' do
    it 'should return the load yml of the source' do
      expect(@item.exemptions).to eql(%w[chocolate book pill])
    end
  end
end
