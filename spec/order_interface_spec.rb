require 'order_interface'

describe OrderInterface do 

  let(:calzone) { Dish.new("Calzone", 7) }

  it 'should enable customer to input order' do 
    menu = Menu.new
    menu.store(calzone)
    interface = OrderInterface.new(menu)
    allow(interface).to receive(:item).and_return("calzone")
    allow(interface).to receive(:quantity).and_return(2)
    interface.select
    expect(interface.order.dish_count).to eq(2)
  end

  it 'can check the sum total of the order vs user sum total' do 
    menu = Menu.new
    menu.store(calzone)
    interface = OrderInterface.new(menu)
    allow(interface).to receive(:item).and_return("calzone")
    allow(interface).to receive(:quantity).and_return(2)
    interface.select
    allow(interface).to receive(:input_sum_total).and_return(14)
    expect(interface.sum_total_correct?).to be true
  end


end