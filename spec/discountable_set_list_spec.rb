require 'discountable_set_list'

describe DiscountableSetList do
  subject(:set_list) { described_class.new }

  describe 'discountable set list' do
    it 'has empty set list on initialisation' do
      expect(set_list.setlist).to eq []
    end

    it 'removes 5, 3 combination and replaces it with 4, 4' do
      set_list.setlist.push(5, 3)
      expect(set_list.check_for_edge_case).to eq [4, 4]
    end

    it 'removes multiple 5, 3 combinations and replaces them with 4, 4 pairs' do
      set_list.setlist.push(5, 3, 5, 3, 5, 3)
      expect(set_list.check_for_edge_case).to eq [4, 4, 4, 4, 4, 4]
    end

    it 'preserves single sets of 3 when removing edge cases' do
      set_list.setlist.push(5, 3, 3)
      expect(set_list.check_for_edge_case).to eq [3, 4, 4]
    end

    it 'preserves single sets of 5 when removing edge cases' do
      set_list.setlist.push(5, 5, 3)
      expect(set_list.check_for_edge_case).to eq [5, 4, 4]
    end
  end

end
