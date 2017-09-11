require 'maximum_discount_finder'

describe MaximumDiscountFinder do
  subject(:max_discount_finder) { described_class.new }

  describe 'simple basket' do
    it 'splits basket into right number of discountable sets' do
      expect(max_discount_finder.no_of_discountable_sets([1])).to eq [1]
      expect(max_discount_finder.no_of_discountable_sets([1, 1])).to eq [1, 1]
      expect(max_discount_finder.no_of_discountable_sets([1, 2])).to eq [2]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3])).to eq [3]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4])).to eq [4]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4, 5])).to eq [5]
    end
  end

  describe 'complex basket' do
    it 'splits basket into right number of discountable sets' do
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4, 1])).to eq [4, 1]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 4, 5, 1, 4])).to eq [4, 2]
      expect(max_discount_finder.no_of_discountable_sets([3, 4, 3, 4, 3, 4])).to eq [2, 2, 2]
    end
  end

  describe 'complex basket with edge cases' do
    it 'removes 5, 3 edge cases in discountable sets for optimal discount ' do
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4, 5, 1, 2, 3])).to eq [4, 4]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4, 5, 2, 3, 4, 2])).to eq [1, 4, 4]
      expect(max_discount_finder.no_of_discountable_sets([1, 2, 3, 4, 5, 1, 2, 3, 1, 2, 3])).to eq [3, 4, 4]
    end
  end
end
