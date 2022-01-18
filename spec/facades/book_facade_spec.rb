require 'rails_helper'

describe BookFacade do
  describe 'self.new' do
    it 'returns a hash based on a given location and quantity' do
      location = 'denver,co'
      quantity = '5'

      expected = BookFacade.new(location, quantity)
      expect(expected[:total_books]).to be_a Integer
      expect(expected[:books]).to be_a Array
      expect(expected[:weather]).to be_a Hash
      expect(expected[:quantity]).to be_a Integer
    end
  end
end
