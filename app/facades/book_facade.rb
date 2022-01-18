class BookFacade
  def self.new(location, quantity)
    books = OpenLibraryService.find_books(location)
    current_weather = OpenWeatherService.find_weather(MapQuestService.get_coords(location))[:current]
    weather = {
      location: location,
      summary: current_weather[:weather][0][:description],
      temperature: "#{current_weather[:temp].round} F"
    }

    {
      book_response: books,
      weather: weather,
      quantity: quantity
    }
  end
end
