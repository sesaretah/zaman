class Overlap < ActiveRecord::Base
  require 'rgl/adjacency'
  require 'rgl/connected_components'
  self.primary_key = 'uuid'
  belongs_to :event

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def self.sets(day)
    #caution Do this for a single user not all !
    @overlaps = Overlap.joins(:event).where(events: {event_date: day}).distinct
    g = RGL::DirectedAdjacencyGraph[]
    for overlap in @overlaps
      g.add_edge "#{overlap.event_id}","#{overlap.overlaper_id}"
    end
    if @overlaps.blank?
      @ev = Event.where(event_date: day)
    else
      @ev = Event.where("event_date = ? and id NOT IN (?)", day,Overlap.joins(:event).where(events: {event_date: day}).distinct.pluck(:event_id, :overlaper_id).flatten.uniq)
    end
    for event in @ev
      g.add_vertex event.id
    end
    @components = []
    g.to_undirected.each_connected_component { |c| @components <<  c }
    @reslut = []

    for component in @components
      @events = Event.where('uuid IN (?)', component).order(:starts_at)
      if !@events.blank?
        @reslut << {lead: @events.first, members: component}
      end
    end
    return @reslut
  end

  before_create :set_integer_id
  def set_integer_id
    @last = Overlap.all.order('integer_id desc').first
    if !@last.blank?
      @last_id = @last.integer_id
    else
      @last_id = 0
    end
    self.integer_id = @last_id + 1
  end

  def id
    self.uuid
  end

  def self.find(uuid)
    Overlap.find_by_uuid(uuid)
  end
end
