class LocationFacade
  def self.get_coords(location)
    MapQuestService.get_coords(location)
  end
end
