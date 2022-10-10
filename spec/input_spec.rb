# frozen_string_literal: true

require './lib/input'

# spec/input_spec.rb
describe Input do
  before do
    @str = '1 box of books at 14.50'
  end
  describe '#parse' do
    it 'should parse the input into appropiate format' do
      h = {}
      h[:name] = 'box of books'
      h[:quantity] = '1'
      h[:price] = '14.50'
      expect(Input.parse(@str)).to eql(h)
    end
  end
end
