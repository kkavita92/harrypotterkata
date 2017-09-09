class MaximumDiscountFinder

  BOOKS_INDEX = [1, 2, 3, 4, 5]

  def no_of_discountable_sets(basket)
    sorted_basket = sort_basket_by_title(basket)

    discountable_sets = []
    while sorted_basket.max > 0
      discountable_sets << 5 - sorted_basket.count(0)
      sorted_basket.map! do |book_count|
        book_count > 0 ? book_count -= 1 : book_count
      end
    end

     check_for_edge_case(discountable_sets)
     discountable_sets
  end

  private

  def check_for_edge_case(discountable_sets)
    replace(discountable_sets) if (discountable_sets.include?(3) && discountable_sets.include?(5))
  end

  def number(discountable_sets)
    [discountable_sets.count(3), discountable_sets.count(5)].min * 2
  end

  def replace(discountable_sets)
    discountable_sets.fill(4, discountable_sets.size, number(discountable_sets))

    count = number(discountable_sets)/2
    while count > 0
      discountable_sets.delete_at(discountable_sets.index(5))
      discountable_sets.delete_at(discountable_sets.index(3))
      count -= 1
    end

    discountable_sets
  end

  def sort_basket_by_title(basket)
    BOOKS_INDEX.map do |book_index|
      basket.count(book_index)
    end
  end

end
