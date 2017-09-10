require_relative 'discountable_sets'

class MaximumDiscountFinder

  BOOKS_INDEX = [1, 2, 3, 4, 5]

  def initialize(list = DiscountableSets)
    @list = list.new
  end

  def no_of_discountable_sets(basket)
    sorted_basket = sort_basket_by_title(basket)
    @list.empty

    while sorted_basket.max > 0
      @list.sets << 5 - sorted_basket.count(0)
      sorted_basket.map! do |book_count|
        book_count > 0 ? book_count -= 1 : book_count
      end
    end

     @list.check_for_edge_case
     @list.sets
  end

  private

  def sort_basket_by_title(basket)
    BOOKS_INDEX.map do |book_index|
      basket.count(book_index)
    end
  end

end
