require 'rails_helper'

describe OpenWeatherService do
  describe 'self.find_weather' do
    it 'returns a weather response based on a lat/long' do
      latlng = {:lat=>39.738453, :lng=>-104.984853}
      
      expected = OpenWeatherService.find_weather(latlng)
      expect(expected).to be_a Hash
    end
  end
end
