class CalendarController < ApplicationController
  def day
    @time = Time.at(params[:unix_time].to_i / 1000)
    @events = Event.where('event_date = ? and user_id = ?', @time.to_date, current_user.id)
    @sets = Overlap.sets(@time.to_date, current_user.id)
    render partial: 'day', locals: {time: @time}
  end

  def week
    @time = Time.at(params[:unix_time].to_i / 1000)
    @events = Event.where('event_date = ? and user_id = ?', @time.to_date, current_user.id)
    @sets = Overlap.sets(@time.to_date, current_user.id)
  end
end
