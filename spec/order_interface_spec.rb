require 'order_interface'

describe OrderInterface do 

  let(:interface) { OrderInterface.new }

  it 'should enable customer to input order' do 
    expect{interface.select('calzone', 2)}.to change{interface.order.dish_count}.by 2
  end

end