class HoroscopesController < ApplicationController
    require 'nokogiri'
    require 'open-uri'
    require 'pry'

    @@arr = []

    def index
       horoscopes = Horoscope.all 
       render json: HoroscopeSerializer.new(horoscopes).to_serialized_json
    end 
    
    def create
        horoscope = Horoscope.new(name, start_date, end_date, symbol, house, planet, element, quality, polarity)
    end

end
