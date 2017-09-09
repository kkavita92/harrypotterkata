require_relative 'maximum_discount_finder'
require_relative 'discount_calculator'

class Calculator

  BOOK_PRICE = 8
  
  def initialize(discount_finder = MaximumDiscountFinder, discount_calculator = DiscountCalculator)
    @discount_finder = discount_finder.new
    @discount_calculator = discount_calculator.new
  end

  def get_price(basket)
    return discount_price(basket) unless all_basket_same?(basket)
    full_price(basket)
  end

  private

  def divide_basket_into_discountable_sets(basket)
    @discount_finder.no_of_discountable_sets(basket)
  end

  def discount_price(basket)
    indexed_basket = divide_basket_into_discountable_sets(basket)
    @discount_calculator.get_total_discount(indexed_basket)
  end

  def full_price(basket)
    basket.length * BOOK_PRICE
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
