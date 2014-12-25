require './lib/twilio_module'
require './lib/menu'
require './lib/order'

class OrderInterface 

  attr_reader :order
  attr_accessor :menu

  include Twilio

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
    puts welcome_message
    interactive_menu
  end

  def welcome_message
    "Hi, and welcome to Jake's pizza!"
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
    return total.to_i
  end

  def sum_total_correct?
    @order.sum_total_correct?(input_sum_total)
  end

  def select_multiple_dishes
    select
    puts "Anything else? (yes, no)"
    until gets.chomp == "no" 
      select
      puts "Anything else? (yes, no)"
    end
  end

  def selection(input)
    case input
      when "1"
        @menu.read.each do |item|
          puts item.name.capitalize + ", £#{item.price}"
        end
      when "2"
        select_multiple_dishes
        if sum_total_correct?
          send_text 
        else
          puts "That's not the correct sum total!"
          input == 2 
        end
      when "9"
        puts "Goodbye"
        exit
      else
        puts "I don't know what you mean."
    end
  end

  def print_menu
    "Please select from the following options: 
     1. Read menu
     2. Order food
     3. Display order 
     9. Exit"
  end

  def interactive_menu
    loop do 
      puts print_menu
      selection(gets.chomp)
    end
  end

end