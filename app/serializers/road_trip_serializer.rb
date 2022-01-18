class RoadTripSerializer
  def self.new(road_trip)
    if road_trip[:time]
      {
        "data": {
          "id": nil,
          "type": "roadtrip",
          "attributes": {
            "start_city": road_trip[:origin],
            "end_city": road_trip[:destination],
            "travel_time": road_trip[:time],
            "weather_at_eta": {
              "temperature": road_trip[:temperature],
              "conditions": road_trip[:conditions]
            }
          }
        }
      }
    else
      {
        "data": {
          "id": nil,
          "type": "roadtrip",
          "attributes": {
            "start_city": road_trip[:origin],
            "end_city": road_trip[:destination],
            "travel_time": "impossible",
            "weather_at_eta": {}
          }
        }
      }
    end
  end
end
