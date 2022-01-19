require 'rails_helper'

describe RoadTripFacade do
  it 'returns information for a given roadtrip' do
    origin = "denver,co"
    destination = "pueblo,co"

    expected = RoadTripFacade.new(origin, destination)

    expect(expected[:origin]).to eq(origin)
    expect(expected[:destination]).to eq(destination)
    expect(expected[:time]).to be_a String
    expect(expected[:temperature]).to be_a Float
    expect(expected[:conditions]).to be_a String
  end

  it 'returns nil for temp and conditions if time is nil' do
    origin = "denver,co"
    destination = "london,uk"

    expected = RoadTripFacade.new(origin, destination)

    expect(expected[:origin]).to eq(origin)
    expect(expected[:destination]).to eq(destination)
    expect(expected[:time]).to be nil
    expect(expected[:temperature]).to be nil
    expect(expected[:conditions]).to be nil
  end
end
