class OpenLibraryService
  def self.find_books(area)
    content = conn.get("?q=#{area}")
    body = parse_response(content)
    {
    number_found: body[:numFound],
    books: body[:docs]
    }
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://openlibrary.org/search.json")
  end
end
