require 'menu'

describe Menu do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  it 'should store and read dishes' do 
    menu.store(calzone)
    expect(menu.read.first.name).to eq('calzone')
    expect(menu.read.first.price).to eq(7)
  end

  it 'should find individual dishes' do 
    menu.store(calzone)
    expect(menu.find('calzone').name).to eq('calzone')
    expect(menu.find('calzone').price).to eq(7)
  end


end