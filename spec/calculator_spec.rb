require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }

  describe 'basic basket' do
    it 'calculates price for empty basket' do
      empty_basket = []
      expect(calculator.get_price(empty_basket)).to eq 0
    end

    it 'calculates price for basket with one item' do
      expect(calculator.get_price([1])).to eq 8 
    end
  end

end
