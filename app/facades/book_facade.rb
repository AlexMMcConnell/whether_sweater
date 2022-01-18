class BookFacade
  def self.new(location, quantity)
    book_response = OpenLibraryService.find_books(location)
    current_weather = OpenWeatherService.find_weather(MapQuestService.get_coords(location))[:current]
    weather = {
      location: location,
      summary: current_weather[:weather][0][:description],
      temperature: "#{current_weather[:temp].round} F"
    }

    {
      total_books: book_response[:number_found],
      books: book_response[:books],
      weather: weather,
      quantity: quantity
    }
  end
end
