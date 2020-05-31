class PagesController < ApplicationController
  def home
    @upcoming_event = Event.order(start_date: :desc).limit(4)
  end

  def search
  end
end
