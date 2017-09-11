require 'discount_calculator'

describe DiscountCalculator do
  subject(:discount_calculator) { described_class.new }

  describe 'indexed basket' do
    it 'calculates optimal discounted price for single book set' do
      expect(discount_calculator.get_total_discount([1])).to eq 8
      expect(discount_calculator.get_total_discount([2])).to eq 0.95 * 16
      expect(discount_calculator.get_total_discount([3])).to eq 0.90 * 24
      expect(discount_calculator.get_total_discount([4])).to eq 0.80 * 32
      expect(discount_calculator.get_total_discount([5])).to eq 0.75 * 40
    end

    it 'calculates optimal discounted price for multiple book sets' do
      expect(discount_calculator.get_total_discount([2, 1])).to eq 23.2
      expect(discount_calculator.get_total_discount([5, 4, 2])).to eq 70.8
      expect(discount_calculator.get_total_discount([4, 4, 1])).to eq 59.2
    end
  end

end
