class Calculator

  def get_price(basket)
    return discount_price unless all_basket_same?(basket)
    basket.length * 8
  end

  private

  def discount_price
    30
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
