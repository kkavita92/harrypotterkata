class DiscountCalculator
  BOOK_PRICE = 8
  TWO_BOOK_DISCOUNT = 0.05
  THREE_BOOK_DISCOUNT = 0.10
  FOUR_BOOK_DISCOUNT = 0.20
  FIVE_BOOK_DISCOUNT = 0.25

  def get_total_discount(indexed_basket)
    indexed_basket.map do |no_of_books_in_set|
      calculate_discount(no_of_books_in_set)
    end.reduce(:+)
  end

  private

  def calculate_discount(no_of_books_in_set)
    return BOOK_PRICE if no_of_books_in_set == 1
    return two_book_discount if no_of_books_in_set == 2
    return three_book_discount if no_of_books_in_set == 3
    return four_book_discount if no_of_books_in_set == 4
    return five_book_discount if no_of_books_in_set == 5
  end

  def two_book_discount
    return (2 * BOOK_PRICE) * (1 - TWO_BOOK_DISCOUNT)
  end

  def three_book_discount
    return (3 * BOOK_PRICE) * (1 - THREE_BOOK_DISCOUNT)
  end

  def four_book_discount
    return (4 * BOOK_PRICE) * (1 - FOUR_BOOK_DISCOUNT)
  end

  def five_book_discount
    return (5 * BOOK_PRICE) * (1 - FIVE_BOOK_DISCOUNT)
  end
end
