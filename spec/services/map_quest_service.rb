require 'rails_helper'

describe MapQuestService do
  describe 'self.get_coords' do
    it 'returns the coordinates for a given location' do
      location = 'denver,co'

      expected = MapQuestService.get_coords(location)
      expect(expected).to be_a Hash
    end
  end

  describe 'self.get_route_time' do
    it 'returns the time for a given route' do
      origin = 'denver,co'
      destination = 'pueblo,co'

      expected = MapQuestService.get_route_time(origin, destination)
      expect(expected).to be_a String
    end

    it 'returns nil if the route is invalid' do
      origin = 'denver,co'
      destination = 'london,uk'

      expected = MapQuestService.get_route_time(origin, destination)
      expect(expected).to be nil
    end
  end
end
