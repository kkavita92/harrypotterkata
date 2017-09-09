class Calculator

  BOOK_PRICE = 8
  BOOKS_INDEX = [1, 2, 3, 4, 5]

  def get_price(basket)
    return discount_price(basket) unless all_basket_same?(basket)
    full_price(basket)
  end

  private

  def divide_basket_into_discountable_sets(basket)
    sorted_basket = sort_basket_by_title(basket)

    no_of_discountable_sets = []
    while sorted_basket.max > 0
      no_of_discountable_sets << 5 - sorted_basket.count(0)
      sorted_basket.map! do |book_count|
        book_count > 0 ? book_count -= 1 : book_count
      end
    end

     no_of_discountable_sets
  end

  def sort_basket_by_title(basket)
    BOOKS_INDEX.map do |book_index|
      basket.count(book_index)
    end
  end

  def discount_price(basket)
    indexed_basket = divide_basket_into_discountable_sets(basket)
    indexed_basket.map do |no_of_books_in_set|
      no_of_books_in_set == 1 ? no_of_books_in_set * BOOK_PRICE : calculate_discount(no_of_books_in_set)
    end.reduce(:+)
  end

  def calculate_discount(no_of_books_in_set)
    return 0.95 * 16 if no_of_books_in_set == 2
    return 0.90 * 24 if no_of_books_in_set == 3
    return 0.80 * 32 if no_of_books_in_set == 4
    return 0.75 * 40 if no_of_books_in_set == 5
  end

  def full_price(basket)
    basket.length * BOOK_PRICE
  end

  def all_basket_same?(basket)
    basket.all? {|book| book == basket[0]}
  end

end
