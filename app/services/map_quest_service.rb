class MapQuestService
  def self.get_coords(location)
    content = conn.get("?key=#{ENV['map_quest_key']}&location=#{location}")
    body = parse_response(content)
    body[:results][0][:locations][0][:latLng]
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/address")
  end
end
