class DiscountCalculator

  BOOK_PRICE = 8

  def get_total_discount(indexed_basket)
    indexed_basket.map do |no_of_books_in_set|
      calculate_discount(no_of_books_in_set)
    end.reduce(:+)
  end

  def calculate_discount(no_of_books_in_set)
    return BOOK_PRICE if no_of_books_in_set == 1
    return 0.95 * 16 if no_of_books_in_set == 2
    return 0.90 * 24 if no_of_books_in_set == 3
    return 0.80 * 32 if no_of_books_in_set == 4
    return 0.75 * 40 if no_of_books_in_set == 5
  end

end
