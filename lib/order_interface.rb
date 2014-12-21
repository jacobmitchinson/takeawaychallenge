require './lib/menu'
require './lib/order'

class OrderInterface 

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
    puts welcome_message
    puts @menu
  end

  def welcome_message
    "Hi, and welcome to Jake's pizza!"
    "Here's the menu: "
  end

  # def selection
  #   "Please select your dish like so, 'calzone', 2:"
  #   select()
  # end

  def select(item, quantity)
    @order.item(item, quantity)
  end 




end