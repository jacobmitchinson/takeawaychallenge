class Menu

  def initialize
    @menu = []
  end

  def store(item)
    @menu << item
  end

  def read
    @menu.each { |item| return item } 
  end

  def find(desired_item)
    @menu.select.first { |item| item.name == desired_item.downcase }
  end

end