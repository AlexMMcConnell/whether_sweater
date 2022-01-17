require 'rails_helper'

describe 'forecast_index' do
  it 'returns expected json information' do
    get '/api/v1/forecast?location=denver,co'

    result_forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    current_weather = result_forecast[:attributes][:current_weather]
    daily_weather = result_forecast[:attributes][:daily_weather]
    hourly_weather = result_forecast[:attributes][:hourly_weather]

    expect(result_forecast[:id]).to be nil
    expect(result_forecast[:type]).to eq "forecast"
    expect(result_forecast[:attributes]).to be_a Hash

    expect(current_weather).to be_a Hash
    expect(daily_weather).to be_a Hash
    expect(hourly_weather).to be_a Array

    expect(current_weather[:datetime].to_time).to be_a Time
    expect(current_weather[:sunrise].to_time).to be_a Time
    expect(current_weather[:sunset].to_time).to be_a Time
    expect(current_weather[:temperature]).to be_a Float
    expect(current_weather[:feels_like]).to be_a Float
    expect(current_weather[:humidity]).to be_a Integer
    expect(current_weather[:uvi]).to be_a Float
    expect(current_weather[:visibility]).to be_a Float
    expect(current_weather[:conditions]).to be_a String
    expect(current_weather[:icon]).to be_a String

    expect(daily_weather[:date].to_date).to be_a Date
    expect(daily_weather[:sunrise].to_time).to be_a Time
    expect(daily_weather[:sunset].to_time).to be_a Time
    expect(daily_weather[:max_temp]).to be_a Float
    expect(daily_weather[:min_temp]).to be_a Float
    expect(daily_weather[:conditions]).to be_a String
    expect(daily_weather[:icon]).to be_a String

    hourly_weather.each do |h|
      expect(h[:time].to_time).to be_a Time
      expect(h[:temperature]).to be_a Float
      expect(h[:conditions]).to be_a String
      expect(h[:icon]).to be_a String
    end
  end

  it 'doesnt return unexpected information in json package' do
    get '/api/v1/forecast?location=denver,co'

    result_forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    current_weather = result_forecast[:attributes][:current_weather]
    daily_weather = result_forecast[:attributes][:daily_weather]
    hourly_weather = result_forecast[:attributes][:hourly_weather]

    expect(current_weather[:dt]).to be_nil
    expect(current_weather[:pressure]).to be_nil
    expect(current_weather[:dew_point]).to be_nil
    expect(current_weather[:clouds]).to be_nil
    expect(current_weather[:wind_speed]).to be_nil
    expect(current_weather[:wind_deg]).to be_nil
    expect(current_weather[:wind_gust]).to be_nil
    expect(current_weather[:weather]).to be_nil

    expect(daily_weather[:moonrise]).to be_nil
    expect(daily_weather[:moonset]).to be_nil
    expect(daily_weather[:moon_phase]).to be_nil
    expect(daily_weather[:temp]).to be_nil
    expect(daily_weather[:feels_like]).to be_nil
    expect(daily_weather[:pressure]).to be_nil
    expect(daily_weather[:humidity]).to be_nil
    expect(daily_weather[:dew_point]).to be_nil
    expect(daily_weather[:wind_speed]).to be_nil
    expect(daily_weather[:wind_deg]).to be_nil
    expect(daily_weather[:wind_gust]).to be_nil
    expect(daily_weather[:weather]).to be_nil
    expect(daily_weather[:clouds]).to be_nil
    expect(daily_weather[:pop]).to be_nil
    expect(daily_weather[:uvi]).to be_nil

    hourly_weather.each do |h|
      expect(h[:dt]).to be_nil
      expect(h[:feels_like]).to be_nil
      expect(h[:pressure]).to be_nil
      expect(h[:humidity]).to be_nil
      expect(h[:dew_point]).to be_nil
      expect(h[:uvi]).to be_nil
      expect(h[:clouds]).to be_nil
      expect(h[:visiblity]).to be_nil
      expect(h[:wind_speed]).to be_nil
      expect(h[:wind_deg]).to be_nil
      expect(h[:wind_gust]).to be_nil
      expect(h[:weather]).to be_nil
    end
  end
end
