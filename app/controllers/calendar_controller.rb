class CalendarController < ApplicationController
  def day
    @time = Time.at(params[:unix_time].to_i / 1000)
    @events = Event.where('event_date = ?', @time.to_date)
    @sets = Overlap.sets(@time.to_date)
    render partial: 'day', locals: {time: @time}
  end
end
