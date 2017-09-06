class Calculator

  def get_price(basket)
    return discount_price(basket) unless all_basket_same?(basket)
    basket.length * 8
  end

  private

  def discount_price(basket)
    return 0.95 * (basket.length * 8) if basket.length == 2
    return 0.75 * (basket.length * 8) if basket.length == 5
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
