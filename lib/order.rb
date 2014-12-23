require './lib/menu.rb'

class Order

  def initialize(menu)
    @dishes = []
    @menu = menu
  end

  def item(desired_item, quantity = 1)
    item = @menu.find(desired_item)
    quantity.times { @dishes << item }
  end

  def sum_total
    @dishes.inject { |memo, item| memo.price + item.price }
  end

  def sum_total_correct?(input_sum_total)
    input_sum_total == sum_total ? true : false
  end

  def dish_count
    @dishes.count
  end



end