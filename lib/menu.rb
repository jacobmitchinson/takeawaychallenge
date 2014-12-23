require 'yaml'
require './lib/dish'

class Menu

  def initialize
    @menu = []
    load
  end

  def save
    yaml = YAML::dump(@menu)
    mode = "w+"
    file = open("./lib/menu.yml", mode)
    file.write("#{yaml}")
    file.close
  end

  def load 
    load = File.read('./lib/menu.yml')
    @menu = YAML::load(load)
  end

  def store(item)
    @menu << item
    save
  end

  def read
    @menu.each { |item| item } 
  end

  def find(desired_item)
    @menu.select.first { |item| item.name == desired_item.downcase }
  end

end