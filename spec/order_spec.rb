require 'order'
require 'menu'

describe Order do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:menu) { Menu.new }
  let(:order) { Order.new(menu) }

  it 'should store desired dishes' do 
    expect{order.item('calzone', 2)}.to change{order.dish_count}.by 2
  end

  it 'should total up the order' do 
    order.item('calzone', 2)
    expect(order.sum_total).to eq(14)
  end 

  it 'should check the input total is the same as the sum total' do
    order.item('calzone', 2)
    expect(order.sum_total_correct?(14)).to be true 
  end

end