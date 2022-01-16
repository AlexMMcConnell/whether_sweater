class MapQuestService
  def self.get_coords(location)
    content = conn.get("/geocoding/v1/address?key=#{ENV['map_quest_key']}&location=#{location}")
    body = parse_response(content)
    long_lat = body[:results][:locations][0][:latLng]
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com")
  end
end
