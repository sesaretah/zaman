class CalendarController < ApplicationController
  def day
    @time = Time.at(params[:unix_time].to_i / 1000)
    render partial: 'day', locals: {time: @time}
  end
end
