require 'rails_helper'

describe LocationFacade do
  it 'returns a set of coordinates given a location' do
    location = 'denver,co'

    expected = LocationFacade.new(location)
    expect(expected).to be_a Hash
    expect(expected[:lng]).to be_a Float
    expect(expected[:lat]).to be_a Float
  end
end
