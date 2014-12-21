require 'menu'

describe Menu do 

  let(:calzone) { Dish.new("Calzone", 7) }
  let(:menu) { Menu.new }

  it 'should store dishes' do 
    menu.store(calzone)
    expect(menu.read).to eq(calzone)
  end


end