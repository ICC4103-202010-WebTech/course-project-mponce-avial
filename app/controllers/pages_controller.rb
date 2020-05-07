class PagesController < ApplicationController
  def home
    @upcoming_event = Event.all
  end
end
