require './lib/menu'
require './lib/order'

class OrderInterface 

  attr_reader :order
  attr_accessor :menu

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
    puts welcome_message
    puts @menu.read
    input
  end

  def welcome_message
    "Hi, and welcome to Jake's pizza!"
    "Here's the menu: "
  end

  # def selection
  #   "Please select your dish like so, 'calzone', 2:"
  #   select()
  # end

  def select
    @order.item(input)
  end 

  def input
    puts "Please specify the item you would like: "
    item = gets.chomp
    puts "Please specify the quantity you would like: "
    quantity = gets.chomp
    return item, quantity
  end


end