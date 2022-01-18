require 'rails_helper'

describe 'books_index' do
  it 'returns expected json information' do
    location = 'denver,co'
    quantity = 5
    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    expect(response).to be_successful

    book_response = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(book_response[:id]).to be nil
    expect(book_response[:type]).to eq "books"
    expect(book_response[:attributes]).to be_a Hash

    attributes = book_response[:attributes]

    expect(attributes[:destination]).to eq(location)
    expect(attributes[:forecast]).to be_a Hash
    expect(attributes[:forecast][:summary]).to be_a String
    expect(attributes[:forecast][:temperature]).to be_a String
    expect(attributes[:books]).to be_a Array
    expect(attributes[:books].length).to eq(quantity)

    books = attributes[:books]

    books.each do |book|
      expect(book[:isbn]).to be_a Array
      expect(book[:isbn][0]).to be_a String
      expect(book[:isbn][1]).to be_a String
      expect(book[:title]).to be_a String
      expect(book[:publisher]).to be_a Array
      expect(book[:publisher][0]).to be_a String
    end
  end
end
