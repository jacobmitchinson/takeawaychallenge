class Menu

  def initialize
    @menu = []
  end

  def store(item)
    @menu << item
  end

  def read
    @menu.each do |item|
      return item
    end
  end

end