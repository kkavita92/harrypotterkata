class MaximumDiscountFinder

  BOOKS_INDEX = [1, 2, 3, 4, 5]

  def no_of_discountable_sets(basket)
    sorted_basket = sort_basket_by_title(basket)

    no_of_discountable_sets = []
    while sorted_basket.max > 0
      no_of_discountable_sets << 5 - sorted_basket.count(0)
      sorted_basket.map! do |book_count|
        book_count > 0 ? book_count -= 1 : book_count
      end
    end

     check_for_edge_case(no_of_discountable_sets)
     no_of_discountable_sets
  end

  def check_for_edge_case(no_of_discountable_sets)
    replace(no_of_discountable_sets) if no_of_discountable_sets.include?(3) && no_of_discountable_sets.include?(5) 
  end

  def replace(no_of_discountable_sets)
    no_of_discountable_sets.push 4 if no_of_discountable_sets.delete 5
    no_of_discountable_sets.push 4 if no_of_discountable_sets.delete 3
  end

  def sort_basket_by_title(basket)
    BOOKS_INDEX.map do |book_index|
      basket.count(book_index)
    end
  end

end
