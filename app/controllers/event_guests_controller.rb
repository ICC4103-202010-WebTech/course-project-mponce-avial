class EventGuestsController < ApplicationController
  before_action :set_event_guest, only: [:show, :edit, :update, :destroy]

  # GET /event_guests
  # GET /event_guests.json
  def index
    @event_guests = EventGuest.all
  end

  # GET /event_guests/1
  # GET /event_guests/1.json
  def show
  end

  # GET /event_guests/new
  def new
    @event = Event.find(params[:event_id])
    @event_guest = EventGuest.new

    @already_invited=[]

    EventGuest.where(event_id: params[:event_id]).each do |e|
      @already_invited.push(e.registered_user_id)
    end

    @users= RegisteredUser.where.not(id: @already_invited )
    @event_guests = EventGuest.where(event_id: params[:event_id]).where.not(registered_user_id: @event.event_creator_id)
  end

  # GET /event_guests/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @event_guest = EventGuest.find(params[:id])
  end

  # POST /event_guests
  # POST /event_guests.json
  def create
    @event_guest = EventGuest.new
    @event_guest.event_id = params[:event_guest][:event]
    @event_guest.registered_user_id = params[:event_guest][:invite]

    if @event_guest.save
      redirect_to event_path(@event_guest.event.id)
    end
  end

  # PATCH/PUT /event_guests/1
  # PATCH/PUT /event_guests/1.json
  def update
    if params[:date_vote]!=nil
      if @event_guest.update(date_vote: params[:date_vote])
        redirect_to event_path(@event_guest.event.id), notice: "Your vote was saved"
      end
    end
  end

  # DELETE /event_guests/1
  # DELETE /event_guests/1.json
  def destroy
    @event_guest.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_guest
      @event_guest = EventGuest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_guest_params
      params.fetch(:event_guest, {})
    end
end
