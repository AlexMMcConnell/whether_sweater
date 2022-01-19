class PexelsService
  def self.get_image(location)
    content = conn.get("search?query=#{location}")
    body = parse_response(content)
    body[:photos].first
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.pexels.com/v1/")
  end
end
