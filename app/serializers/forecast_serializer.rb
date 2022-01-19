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
            "temperature": weather[:current][:temp].to_f,
            "feels_like": weather[:current][:feels_like].to_f,
            "humidity": weather[:current][:humidity],
            "uvi": weather[:current][:uvi].to_f,
            "visibility": weather[:current][:visiblity].to_f,
            "conditions": weather[:current][:weather][0][:description],
            "icon": weather[:current][:weather][0][:icon]
          },
        "daily_weather":
        weather[:daily][0..4].map do |day|
          {
            "date": Time.at(day[:dt]).to_date.to_s,
            "sunrise": Time.at(day[:sunrise]).to_s,
            "sunset": Time.at(day[:sunset]).to_s,
            "max_temp": day[:temp][:max].to_f,
            "min_temp": day[:temp][:min].to_f,
            "conditions": day[:weather][0][:description],
            "icon": day[:weather][0][:description]
          }
        end,

        "hourly_weather":
          weather[:hourly].map do |h|
            {
              "time": Time.at(h[:dt]).to_s,
              "temperature": h[:temp].to_f,
              "conditions": h[:weather][0][:description],
              "icon": h[:weather][0][:icon]
            }
          end
        }
      }
    }
  end
end
