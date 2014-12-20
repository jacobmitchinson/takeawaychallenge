require 'dish'

describe Dish do
  
  let(:calzone) { Dish.new("Calzone", 7) }

  it 'should be able to return the dish price' do
    expect(calzone.price).to eq(7)
  end

  it 'should be able to return the dish name' do
    expect(calzone.name).to eq("calzone")
  end

end