class ForecastFacade
  def self.new(location)
    weather = OpenWeatherService.find_weather(LocationFacade.new(location))

    {
      current: weather[:current],
      daily: weather[:daily][0..4],
      hourly: weather[:hourly][0..7]
    }
  end
end
