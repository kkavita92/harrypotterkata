class Calculator

  BOOK_PRICE = 8
  BOOKS_INDEX = [1, 2, 3, 4, 5]

  def get_price(basket)
    return discount_price(basket) unless all_basket_same?(basket)
    full_price(basket)
  end

  private

  def sort_basket(basket)
    arr = BOOKS_INDEX.map do |x|
      basket.count(x)
    end

    set = []
    while arr.max > 0
      set << 5 - arr.count(0)
      arr = arr.map do |count|
        count > 0 ? count -= 1 : count
      end
    end

     set
  end

  def discount_price(basket)
    sorted = sort_basket(basket)
    sorted.map do |x|
      x == 1 ? x * 8 : count(x)
    end.reduce(:+)
  end

  def count(x)
    return 0.95 * 16 if x == 2
    return 0.90 * 24 if x == 3
    return 0.80 * 32 if x == 4
    return 0.75 * 40 if x == 5
  end

  def set(basket)
    basket.uniq
  end

  def full_price(basket)
    basket.length * BOOK_PRICE
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
