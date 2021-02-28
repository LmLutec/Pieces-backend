require 'nokogiri'
require 'open-uri'
# require 'pry'



class Scraper  < ApplicationRecord

    @@arr = []

    def self.daily_page
        site = open("https://astrostyle.com/horoscopes/daily/")
        doc = Nokogiri::HTML(site)
        
        doc.css('.my-horoscope-table-wrap').css('a').each do |i|
            @@arr << i.attr('href')
        end 
        daily_readings
    end 

    def self.daily_readings
        @@arr.uniq!.each do |d|
            site = open(d)
            doc = Nokogiri::HTML(site)
            reading = doc.css('.horoscope-content').css('p').text
            byebug
            date = doc.css('.horoscope-content').css('h2').children[0].text.strip
            sign = d.split("/").last.capitalize
            find_horoscope = Horoscope.find_by(name: sign) 
            
            find_horoscope.dailies.each do |i|
                if i.date.to_date != date.to_date
                    find_horoscope.dailies.build(date: date, source: 'test', text: reading)
                #    find_horoscope.dailies << Daily.create(horoscope_id: find_horoscope.id, date: date.to_date, source: 'test', text: reading)
               
                end 
            end 
        end 
    end 
end 