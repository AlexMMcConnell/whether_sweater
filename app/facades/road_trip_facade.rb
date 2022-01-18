class RoadTripFacade
  def self.new(origin, destination)
    time = MapQuestService.get_route_time(origin, destination)
    weather = ForecastFacade.find(destination)
    if time
      temperature = weather[:hourly][time[0..1].to_i][:temp]
      conditions = weather[:hourly][time[0..1].to_i][:weather][0][:description]
    else
      temperature = nil
      conditions = nil
    end
    {
      origin: origin,
      destination: destination,
      time: time,
      temperature: temperature,
      conditions: conditions
    }
  end
end
