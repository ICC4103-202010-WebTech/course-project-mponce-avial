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
    @event_guest = EventGuest.new
  end

  # GET /event_guests/1/edit
  def edit
  end

  # POST /event_guests
  # POST /event_guests.json
  def create
    @event_guest = EventGuest.new(event_guest_params)

    respond_to do |format|
      if @event_guest.save
        format.html { redirect_to @event_guest, notice: 'Event guest was successfully created.' }
        format.json { render :show, status: :created, location: @event_guest }
      else
        format.html { render :new }
        format.json { render json: @event_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_guests/1
  # PATCH/PUT /event_guests/1.json
  def update
    respond_to do |format|
      if @event_guest.update(event_guest_params)
        format.html { redirect_to @event_guest, notice: 'Event guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_guest }
      else
        format.html { render :edit }
        format.json { render json: @event_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_guests/1
  # DELETE /event_guests/1.json
  def destroy
    @event_guest.destroy
    respond_to do |format|
      format.html { redirect_to event_guests_url, notice: 'Event guest was successfully destroyed.' }
      format.json { head :no_content }
    end
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
