class Event < ActiveRecord::Base

  scope :upcoming, -> { where('start_date >= ?', Date.today)}
end
