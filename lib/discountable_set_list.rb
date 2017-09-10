class DiscountableSetList

  attr_reader :setlist

  def initialize
    @setlist = []
  end

  def check_for_edge_case
    optimise_discount if (@setlist.include?(3) && @setlist.include?(5))
    return @setlist
  end

  def reset_list
    @setlist = []
  end

  private

  def number_of_edge_cases
    [@setlist.count(3), @setlist.count(5)].min
  end

  def optimise_discount
    count = number_of_edge_cases

    while count > 0
      remove_edge_case_set
      replace_edge_case_set
      count -= 1
    end
  end

  def remove_edge_case_set
    @setlist.delete_at(@setlist.index(5))
    @setlist.delete_at(@setlist.index(3))
  end

  def replace_edge_case_set
    @setlist.push(4, 4)
  end

end
