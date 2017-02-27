class WelcomeController < ApplicationController
  def index
    @promoted_events = Event.limit(3)
    @events = Event.upcoming
  end
end
