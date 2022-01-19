require 'rails_helper'

describe PexelsService do
  describe 'self.get_image' do
    it 'returns an image hash based on a given location' do
      location = 'denver,co'
      expected = PexelsService.get_image(location)
      expect(expected).to be_a Hash
    end
  end
end
