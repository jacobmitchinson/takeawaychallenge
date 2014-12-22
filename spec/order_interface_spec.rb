require 'order_interface'

describe OrderInterface do 

  let(:calzone) { Dish.new("Calzone", 7) }

  it 'should enable customer to input order' do 
    interface = OrderInterface.new
    interface.order.menu.store(calzone)
    allow(:interface).to receive(:input).and_return('calzone', 2)
    expect(interface.order.dish_count).to eq(2)
  end

end