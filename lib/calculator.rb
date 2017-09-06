class Calculator

  def get_price(basket)
    return discount_price(basket) unless all_basket_same?(basket)
    full_price(basket)
  end

  private

  def discount_price(basket)
    return 0.95 * full_price(basket) if basket.length == 2
    return 0.90 * full_price(basket) if basket.length == 3
    return 0.80 * full_price(basket) if basket.length == 4
    return 0.75 * full_price(basket) if basket.length == 5
  end

  def full_price(basket)
    basket.length * 8
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
