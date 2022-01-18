class ForecastFacade
  def self.new(location, quantity)
    OpenLibraryService.new(location)

  end
end
