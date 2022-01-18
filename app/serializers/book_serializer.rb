class BookSerializer
  def self.new(book_facade)
    {
      "data": {
        "id": nil,
        "type": "books",
        "attributes": {
          "destination": book_facade[:weather][:location],
          "forecast": {
            "summary": book_facade[:weather][:summary],
            "temperature": book_facade[:weather][:temperature]
          },
          "total_books_found": book_facade[:book_response][:number_found],
          "books": book_facade[:book_response][:books].first(book_facade[:quantity].to_i).map do |book|
            {
              "isbn": book[:isbn],
              "title": book[:title],
              "publisher": book[:publisher]
            }
          end
        }
      }
    }
  end
end
