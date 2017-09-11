require_relative 'discountable_set_list'

class MaximumDiscountFinder
  BOOKS_INDEX = [1, 2, 3, 4, 5].dup

  def no_of_discountable_sets(basket, discountable_set_list = DiscountableSetList)
    discountable_set_list = discountable_set_list.new
    sorted_basket = sort_basket_by_title(basket)

    while sorted_basket.max > 0
      discountable_set_list.setlist << BOOKS_INDEX.count - sorted_basket.count(0)
      sorted_basket.map! do |book_count|
        book_count > 0 ? book_count - 1 : book_count
      end
    end

    discountable_set_list.complete_edge_case_check
  end

  private

  def sort_basket_by_title(basket)
    BOOKS_INDEX.map do |book_index|
      basket.count(book_index)
    end
  end
end
