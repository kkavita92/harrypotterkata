require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }

  describe 'basic basket' do
    it 'calculates price for empty basket' do
      empty_basket = []
      expect(calculator.get_price(empty_basket)).to eq 0
    end
  end

end
