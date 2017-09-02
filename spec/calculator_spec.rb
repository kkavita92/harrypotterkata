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
      expect(calculator.get_price([2])).to eq 8
      expect(calculator.get_price([3])).to eq 8
      expect(calculator.get_price([4])).to eq 8
      expect(calculator.get_price([5])).to eq 8
    end

    it 'calculates price for baskets with multiple copies of same book' do
      expect(calculator.get_price([1, 1])).to eq 16
      expect(calculator.get_price([2, 2])).to eq 16
      expect(calculator.get_price([4, 4, 4, 4])).to eq 32
      expect(calculator.get_price([3, 3, 3, 3, 3])).to eq 40
    end
  end

end
