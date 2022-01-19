require 'rails_helper'

describe ForecastFacade do
  before(:each) do
    location = "denver,co"
    @facade = ForecastFacade.new(location)
  end

  it 'returns the current weather' do
    expect(@facade[:current]).to be_a Hash
  end

  it 'returns the next five days of weather' do
    expect(@facade[:daily]).to be_a Array
    expect(@facade[:daily].length).to eq(5)
  end

  it 'returns the next eight hours of weather' do
    expect(@facade[:hourly]).to be_a Array
    expect(@facade[:hourly].length).to eq(8)
  end
end
