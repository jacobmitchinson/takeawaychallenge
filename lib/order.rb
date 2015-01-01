require './lib/menu.rb'

class Order

  def initialize(menu)
    @dishes = []
    @menu = menu
  end

  def item(desired_item, quantity = 1)
    if @menu.find(desired_item) == false
      return "Sorry we don't have that on the menu!"
    else
      item = @menu.find(desired_item)
    end
    quantity.times { @dishes << item }
  end

  def sum_total
    total = @dishes.inject(@dishes[0].price) { |memo, item| memo + item.price } 
    total - @dishes[0].price # bit of an odd implementation but this is done to start memo as the first dish price
  end

  def sum_total_correct?(input_sum_total)
    input_sum_total == sum_total ? true : false
  end

  def dish_count
    @dishes.count
  end

end