class DailiesController < ApplicationController
    def index
        dailies = Daily.all
        render json: DailySerializer.new(dailies).to_serialized_json
    end 

    def create
        daily = Daily.create(date: params[:dateReceived], source: params[:sourceReceived], text: params[:readingReceived])
        daily.horoscope_id = params[:horoscope_id]
    end 
end
