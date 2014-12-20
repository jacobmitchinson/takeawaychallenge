class Dish

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name.downcase
    @price = price
  end

end