class EventsController < ApplicationController
  def create
    if params[:event_date]
      @time = Time.parse(params[:event_date])
    else
      @time = Time.at(params[:unix_time].to_i / 1000)
    end
    @event = Event.new(starts_at: "#{params[:starts_at_hour]}:#{params[:starts_at_minutes]}", ends_at: "#{params[:ends_at_hour]}:#{params[:ends_at_minutes]}", event_date: @time.to_date, content: params[:content])
    @event.user_id = current_user.id
    if @event.save
      #manage_overlaps
      @sets = Overlap.sets(@time.to_date, current_user.id)
      manage_speardables(@event, params[:speardable_type], params[:speardable_id])
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
end
