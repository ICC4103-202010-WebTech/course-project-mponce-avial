class PagesController < ApplicationController
  def home
    @upcoming_event = Event.order(start_date: :desc).limit(6)
  end

  def search
    if params[:q].blank?
      redirect_back(fallback_location: root_path)
    else
      @parameter = params[:q].downcase
      @users = RegisteredUser.all.where("lower(name) LIKE :search OR lower(last_name) LIKE :search OR lower(username) LIKE :search ", search: "%#{@parameter}%")
      @organizations = Organization.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @events = Event.all.where("lower(title) LIKE :search OR lower(description) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def tou
  end

  def tos
  end
end
