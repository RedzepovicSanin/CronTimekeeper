class Event < ActiveRecord::Base
  belongs_to :user
  enum event_type: { working: 0, break: 1 } 

  def self.between(start_time, end_time)
    where(
      'start_at > :lo and start_at < :up',
      lo: Event.format_date(start_time),
      up: Event.format_date(end_time)
    )
  end

  def self.format_date(date_time)
   Time.at(date_time.to_i).to_formatted_s(:db)
  end

  # specifies data inside json object
  def as_json(options = {})
    {
      title: self.event_type.capitalize,
      start: start_at.iso8601,
      end: end_at.iso8601,
      user_id: self.user_id,
      color: '#6eb197'
    }
  end
end