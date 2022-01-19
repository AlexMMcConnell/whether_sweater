def BackgroundsSerializer
  def self.new(image)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "location": image[:location],
            "image_url": image[:url],
            "credit": {
              "source": image[:source],
              "photographer": image[:photographer],
              "photographer_url": image[:photographer_url],
              "logo": image[:logo]
            }
          }
        }
      }
    }
  end
end
