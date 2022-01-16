class OpenWeatherService
  def self.find_weather(latitude, longitude)
    content = conn.get("/data/2.5/onecall?appid=#{ENV['open_weather_key']}&lat=#{latitude}&lon=#{longitude}")
    parse_response(content)
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org")
  end
end
