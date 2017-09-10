class DiscountableSetList

  attr_reader :sets

  def initialize
    @sets = []
  end

  def check_for_edge_case
    optimise_discount if (@sets.include?(3) && @sets.include?(5))
    return @sets
  end

  def number_of_edge_cases
    [@sets.count(3), @sets.count(5)].min
  end

  def optimise_discount
    count = number_of_edge_cases

    while count > 0
      @sets.delete_at(@sets.index(5))
      @sets.delete_at(@sets.index(3))
      @sets.push(4, 4)
      count -= 1
    end
    
  end

  def empty
    @sets = []
  end

end
