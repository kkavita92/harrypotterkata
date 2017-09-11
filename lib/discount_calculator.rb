class DiscountCalculator
  BOOK_PRICE = 8
  DISCOUNTS = [0, 0.05, 0.10, 0.20, 0.25]

  def get_total_discount(indexed_basket)
    indexed_basket.map do |no_of_books_in_set|
      calculate_discount(no_of_books_in_set)
    end.reduce(:+)
  end

  private

  def calculate_discount(no_of_books_in_set)
    (1 - DISCOUNTS[no_of_books_in_set - 1]) * (no_of_books_in_set * BOOK_PRICE)
  end
end
