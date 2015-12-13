class EventDescription < ActiveRecord::Base
  belongs_to :event

  def self.detail(eventId)
    sql = ""
    sql << "select title, description from event_descriptions where event_id = :event_id order by disp_order"
    cond = Hash.new
    cond[:event_id] = eventId
    logger.debug(sql)
    EventDescription.find_by_sql([sql , cond])
  end

end
