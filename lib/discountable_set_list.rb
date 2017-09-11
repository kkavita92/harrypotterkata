class DiscountableSetList
  attr_reader :setlist

  def initialize
    @setlist = []
  end

  def complete_edge_case_check
    remove_all_edge_cases if edge_case?
    @setlist
  end

  private

  def edge_case?
    (@setlist.include?(3) && @setlist.include?(5))
  end

  def number_of_edge_cases
    [@setlist.count(3), @setlist.count(5)].min
  end

  def remove_all_edge_cases
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
