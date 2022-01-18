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
          "total_books_found": book_facade[:total_books],
          "books": book_facade[:books].first(book_facade[:quantity]).map do |book|
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
