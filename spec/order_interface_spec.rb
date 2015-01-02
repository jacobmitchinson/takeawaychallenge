require 'order_interface'

class OrderWithoutInput < OrderInterface

  def initialize 
    @menu = Menu.new
    @order = Order.new(@menu)
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

  context "when receiving an order" do 

    it 'should enable customer to input order' do   
      interface_setup(interface)
      expect(interface.order.dish_count).to eq(2)
    end

    it "should know when an item is not on the menu and let the user know" do
      allow(interface).to receive(:send_text).and_return("sent!")
      allow(interface).to receive(:item).and_return("dog")
      allow(interface).to receive(:quantity).and_return(2)
      allow(interface).to receive(:false_selection).and_return("false selection")
      expect(interface.select).to eq "false selection"
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

    it 'should read the menu' do 
      interface_setup(interface)
      expect(interface.selection("1")).to eq(interface.menu.read)
    end

  end

  context "before completing an order" do 

    it 'should get the sum total from the user and complete the order if it is correct' do
      allow(interface).to receive(:send_text).and_return("sent!")
      allow(interface).to receive(:item).and_return("calzone")
      allow(interface).to receive(:quantity).and_return(2)
      allow(interface).to receive(:input_sum_total).and_return(14)  
      allow(interface).to receive(:gets).and_return("no")
      expect(interface.selection("2")).to eq("Thanks for completing your order with Jake's Pizza") 
    end

    it 'should get the sum total from the user and request that the order total be reentered if it is incorrect' do
      allow(interface).to receive(:send_text).and_return("sent!")
      allow(interface).to receive(:item).and_return("calzone")
      allow(interface).to receive(:quantity).and_return(2)
      allow(interface).to receive(:input_sum_total).and_return(13)
      allow(interface).to receive(:gets).and_return("no")
      expect(interface.selection("2")).to eq(input = 2) 
    end


  end

end