require 'order_interface'

class OrderWithoutInput < OrderInterface

  def initialize 
    @menu = Menu.new
    @order = Order.new(@menu)
    puts welcome_message
  end

end

describe OrderInterface do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:interface) { OrderWithoutInput.new }

  # helper method

  def interface_setup(interface)
    allow(interface).to receive(:send_text).and_return("sent!")
    allow(interface).to receive(:item).and_return("calzone")
    allow(interface).to receive(:quantity).and_return(2)
    interface.select
    return interface
  end

  it 'should enable customer to input order' do   
    interface_setup(interface)
    expect(interface.order.dish_count).to eq(2)
  end

  it 'should get the sum total' do
    interface_setup(interface)
    allow(interface).to receive(:input_sum_total).and_return(14)  
    expect(interface.order.sum_total_correct?(interface.input_sum_total)).to be true
  end

  it 'should enable the user to select multiple dishes' do 
    interface_setup(interface)
    allow(interface).to receive(:gets) do 
      if interface.order.dish_count < 2
        interface.select
      else
        "no"
      end
    end
    interface.select_multiple_dishes
    expect(interface.order.dish_count).to eq 4
  end


end