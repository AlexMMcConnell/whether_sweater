require 'rails_helper'

describe 'backgrounds_index' do
  it 'returns the proper background' do
    location = "denver,co"
    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    image_response = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(image_response[:type]).to eq("image")
    expect(image_response[:id]).to be nil
    expect(image_response[:attributes]).to be_a Hash

    image = image_response[:attributes][:image]
    expect(image).to be_a Hash
    expect(image[:location]).to be_a String
    expect(image[:image_url]).to be_a String
    expect(image[:credit]).to be_a Hash
    expect(image[:credit][:source]).to be_a String
    expect(image[:credit][:photographer]).to be_a String
    expect(image[:credit][:photographer_url]).to be_a String
    expect(image[:credit][:logo]).to be_a String
  end
end
