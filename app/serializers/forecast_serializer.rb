class ForecastSerializer
  include JSONAPI::Serializer

  def self.new(weather)
    {"data":
      {"id": nil,
      "type": "forecast",
      "attributes": {
        "current_weather": {
            "datetime": Time.at(weather[:current][:dt]).to_s,
            "sunrise": Time.at(weather[:current][:sunrise]).to_s,
            "sunset": Time.at(weather[:current][:sunset]).to_s,
            "temperature": weather[:current][:temp],
            "feels_like": weather[:current][:feels_like],
            "humidity": weather[:current][:humidity],
            "uvi": weather[:current][:uvi].to_f,
            "visibility": weather[:current][:visiblity].to_f,
            "conditions": weather[:current][:weather][0][:description],
            "icon": weather[:current][:weather][0][:icon]
          },
        "daily_weather": {
            "date": Time.at(weather[:daily][0][:dt]).to_date.to_s,
            "sunrise": Time.at(weather[:daily][0][:sunrise]).to_s,
            "sunset": Time.at(weather[:daily][0][:sunset]).to_s,
            "max_temp": weather[:daily][0][:temp][:max],
            "min_temp": weather[:daily][0][:temp][:min],
            "conditions": weather[:daily][0][:weather][0][:description],
            "icon": weather[:daily][0][:weather][0][:description]
          },
        "hourly_weather":
          weather[:hourly][0..7].map do |h|
            {
              "time": Time.at(h[:dt]).to_s,
              "temperature": h[:temp],
              "conditions": h[:weather][0][:description],
              "icon": h[:weather][0][:icon]
            }
          end
        }
      }
    }
  end
end
