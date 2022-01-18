class BookSerializer
  def self.new(books, weather, quantity)
    {
      "data": {
        "id": nil,
        "type": "books",
        "attributes": {
          "destination": weather[:city],
          "forecast": {
            "summary": weather[:summary],
            "temperature": weather[:temperature]
          },
          "total_books_found": books.count
          "books": books.first(quantity).map do |book|
            {
              "isbn": [
                num1,
                num2
              ],
              "title": book[:title],
              "publisher": [
                publisher
              ]
            }
          end
        }
      }
    }
  end
end
