require 'order_interface'

describe OrderInterface do 

  let(:calzone) { Dish.new("Calzone", 7) }

  it 'should enable customer to input order' do     
    interface = OrderInterface.new
    allow(interface).to receive(:send_text).and_return("sent!")
    allow(interface).to receive(:interactive_menu)
    allow(interface).to receive(:item).and_return("calzone")
    allow(interface).to receive(:quantity).and_return(2)
    interface.select
    expect(interface.order.dish_count).to eq(2)
  end

  it 'should get the sum total' do
    interface = OrderInterface.new
    allow(interface).to receive(:send_text).and_return("sent!")
    allow(interface).to receive(:interactive_menu)
    allow(interface).to receive(:item).and_return("calzone")
    allow(interface).to receive(:quantity).and_return(2)
    interface.select
    allow(interface).to receive(:input_sum_total).and_return(14)  
    expect(interface.order.sum_total_correct?(interface.input_sum_total)).to be true
  end



end