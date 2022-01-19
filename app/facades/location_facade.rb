class LocationFacade
  def self.new(location)
    MapQuestService.get_coords(location)
  end
end
