require 'order'
require 'menu'

describe Order do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:menu) { Menu.new }
  let(:order) { Order.new(menu) }

  it 'should store desired dishes' do 
    menu.store(calzone)
    expect{order.item('calzone', 2)}.to change{order.dish_count}.by 2
  end

  it 'should total up the order' do 
    menu.store(calzone)
    order.item('calzone', 2)
    expect(order.sum_total).to eq(14)
  end 

end