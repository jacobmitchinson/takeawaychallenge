require 'menu'

describe Menu do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  it 'should store and read dishes' do 
    menu.store(calzone)
    expect(menu.read).to eq(calzone)
  end

  it 'should find individual dishes' do 
    menu.store(calzone)
    expect(menu.find('calzone')).to eq(calzone)
  end


end