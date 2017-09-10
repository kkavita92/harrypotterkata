class DiscountableSets

  attr_reader :sets

  def initialize
    @sets = []
  end

  def check_for_edge_case
    replace if (@sets.include?(3) && @sets.include?(5))
  end

  def number
    [@sets.count(3), @sets.count(5)].min
  end

  def replace
    @sets.fill(4, @sets.size, number * 2)

    count = number
    while count > 0
      @sets.delete_at(@sets.index(5))
      @sets.delete_at(@sets.index(3))
      count -= 1
    end

    @sets
  end

  def empty
    @sets = []
  end

end
