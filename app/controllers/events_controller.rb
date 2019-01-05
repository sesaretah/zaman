class EventsController < ApplicationController
  def create
    @time = Time.parse(params[:event_date])
    @event = Event.new(starts_at: "#{params[:starts_at_hour]}:#{params[:starts_at_minutes]}", ends_at: "#{params[:ends_at_hour]}:#{params[:ends_at_minutes]}", event_date: params[:event_date], content: params[:content])
    @event.user_id = current_user.id
    if @event.save
      manage_overlaps
      @sets = Overlap.sets(@time.to_date, current_user.id)
    end
  end

  def destroy
    @event = Event.find_by_uuid(params[:id])
    @event.user_id = current_user.id
    @time = @event.event_date
    if @event.destroy
      @sets = Overlap.sets(@time.to_date, current_user.id)
    end
  end
  def manage_overlaps
    @overlaps = Event.where('event_date= ?  and uuid <> ? and starts_at <= ? and ends_at >= ? and user_id = ?', @time.to_date, @event.uuid ,@event.ends_at, @event.starts_at, current_user.id)
    for overlap in @overlaps
      Overlap.create(event_id: @event.id, overlaper_id: overlap.id)
    end
  end
end
