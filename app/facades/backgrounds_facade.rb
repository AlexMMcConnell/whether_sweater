class BackgroundsFacade
  def self.new(location)
    given_image = PexelsService.get_image(location)
    image = {
      location: location,
      url: given_image[:url],
      source: 'pexels.com',
      photographer: given_image[:photographer],
      photographer_url: given_image[:photographer_url],
      logo: 'http://images.pexels.com/lib/api/pexels-white.png'
    }
  end
end
