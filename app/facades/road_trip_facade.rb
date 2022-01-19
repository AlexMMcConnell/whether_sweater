class RoadTripFacade
  def self.new(origin, destination)
    time = MapQuestService.get_route_time(origin, destination)
    weather = ForecastFacade.new(destination)
    
    if time && time[0..1].to_i <= 8 && time[0..1].to_f.ceil > 0
      temperature = weather[:hourly][time[0..1].to_i][:temp]
      conditions = weather[:hourly][time[0..1].to_i][:weather][0][:description]
    elsif time
      temperature = weather[:daily][time[0..1].to_i/24][:temp][:day]
      conditions = weather[:daily][time[0..1].to_i/24][:weather][0][:description]
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
