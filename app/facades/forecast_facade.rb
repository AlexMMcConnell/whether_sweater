class ForecastFacade
  def self.find(location)
    OpenWeatherService.find_weather(LocationFacade.get_coords(location))
  end
end
