require './lib/menu'
require './lib/order'

class OrderInterface 

  attr_reader :order
  attr_accessor :menu

  def initialize(menu)
    @menu = menu
    @order = Order.new(@menu)
    puts welcome_message
    puts @menu.read
  end

  def welcome_message
    "Hi, and welcome to Jake's pizza!"
    "Here's the menu: "
  end

  def item
    puts "Please specify the item you would like: "
    item = gets.chomp
    return item
  end

  def quantity 
    puts "Please specify the quantity:"
    quantity = gets.chomp
    return quantity
  end

  def select
    @order.item(item, quantity.to_i)
  end 

  def input_sum_total
    puts "Please enter the sum total of the order:"
    total = gets.chomp
    return total
  end

  def sum_total_correct?
    @order.sum_total_correct?(input_sum_total)
  end

end