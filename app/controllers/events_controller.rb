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
      manage_overlaps
      @sets = Overlap.sets(@time.to_date, current_user.id)
      manage_speardables
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

  def manage_speardables
    if !params[:speardable_type].blank? && !params[:speardable_id].blank?
      @spearding = Spearding.create(speardable_id: params[:speardable_id], speardable_type: params[:speardable_type], event_id: @event.id)
      @item = params[:speardable_type].classify.constantize.find(params[:speardable_id])
    end
  end


end
