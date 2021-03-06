require 'price_calculator'

describe PriceCalculator do
  subject(:price_calculator) { described_class.new }

  describe 'basic basket' do
    it 'calculates price for empty basket' do
      empty_basket = []
      expect(price_calculator.get_price(empty_basket)).to eq 0
    end

    it 'calculates price for basket with one item' do
      expect(price_calculator.get_price([1])).to eq 8
      expect(price_calculator.get_price([2])).to eq 8
      expect(price_calculator.get_price([3])).to eq 8
      expect(price_calculator.get_price([4])).to eq 8
      expect(price_calculator.get_price([5])).to eq 8
    end

    it 'calculates price for baskets with multiple copies of same book' do
      expect(price_calculator.get_price([1, 1])).to eq 16
      expect(price_calculator.get_price([2, 2, 2])).to eq 24
      expect(price_calculator.get_price([4, 4, 4, 4])).to eq 32
      expect(price_calculator.get_price([3, 3, 3, 3, 3])).to eq 40
    end
  end

  describe 'discounted basket' do
    it 'calculates price for two different books' do
      expect(price_calculator.get_price([1, 2])).to eq 0.95 * 16
    end

    it 'calculates price for three different books' do
      expect(price_calculator.get_price([1, 2, 3])).to eq 0.90 * 24
    end

    it 'calculates price for four different books' do
      expect(price_calculator.get_price([1, 2, 3, 4])).to eq 0.80 * 32
    end

    it 'calculates price for full series' do
      expect(price_calculator.get_price([1, 2, 3, 4, 5])).to eq 30
    end
  end

  describe 'complex basket' do
    it 'calculates price for two different titles and one repeated title' do
      expect(price_calculator.get_price([1, 2, 1])).to eq 0.95 * 16 + 8
    end

    it 'calculates price for three different titles and one repeated title' do
      expect(price_calculator.get_price([1, 2, 3, 1])).to eq 0.90 * 24 + 8
    end

    it 'calculates price for four different titles and one repeated title' do
      expect(price_calculator.get_price([1, 2, 3, 4, 1])).to eq 0.80 * 32 + 8
    end

    it 'calculates price for full set and one repeated title' do
      expect(price_calculator.get_price([1, 2, 3, 4, 5, 1])).to eq 30 + 8
    end
  end

  describe 'edge case' do
    it 'optimises discount' do
      expect(price_calculator.get_price([1, 2, 3, 4, 5, 1, 2, 3])).to eq 51.2
      expect(price_calculator.get_price([1, 2, 3, 4, 5, 1, 2, 3, 1])).to eq 59.2
      # expect(price_calculator.get_price([1, 2, 3, 4, 5, 1, 2, 3, 1, 2, 3])).to eq 72.8
      expect(price_calculator.get_price([1, 2, 3, 4, 5, 1, 2, 3, 1, 2, 3, 4, 5, 1, 2, 3])).to eq 102.4
    end
  end
end
