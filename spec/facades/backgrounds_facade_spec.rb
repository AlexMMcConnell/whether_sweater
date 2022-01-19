require 'rails_helper'

describe BackgroundsFacade do
  it 'returns image info' do
    location = 'denver,co'
    expected = BackgroundsFacade.new(location)

    expect(expected[:location]).to eq(location)
    expect(expected[:url]).to be_a String
    expect(expected[:source]).to be_a String
    expect(expected[:photographer]).to be_a String
    expect(expected[:photographer_url]).to be_a String
    expect(expected[:logo]).to be_a String
  end
end
