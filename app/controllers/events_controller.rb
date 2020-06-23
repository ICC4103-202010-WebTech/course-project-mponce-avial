class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    #@events = Event.all
    @events_created = Event.where(event_creator_id: current_registered_user.id)
    @events_joined = Event.joins(:event_guests).where(event_guests:{registered_user_id: current_registered_user.id})
  end

  # GET /events/1
  # GET /events/1.json
  def show
    begin
      @event_guest = EventGuest.where(event_id: params[:id], registered_user_id: current_registered_user.id).take
    rescue
      @event_guest = nil
    end
    @event_comments = Comment.joins(:event).where(event_id: params[:id]).joins(:registered_user)
    @comment_replies = Reply.joins(:comment).where(comment_id: @event_comments)
    @event_images = EventImage.joins(:event).where(event_id: params[:id])
    @event_videos = EventVideo.joins(:event).where(event_id: params[:id])
    @event_pdfs = EventPdf.joins(:event).where(event_id: params[:id])

    @event_vote_1 = EventGuest.where(event_id: params[:id]).where(date_vote: 1).count
    @event_vote_2 = EventGuest.where(event_id: params[:id]).where(date_vote: 2).count
    @event_vote_3 = EventGuest.where(event_id: params[:id]).where(date_vote: 3).count
    @total_votes = @event_vote_1 + @event_vote_2 + @event_vote_3

    if @event.date_rule = true and @total_votes > @event.number_of_voters and  @event.final_date = nil
      if @event_vote_1 = [@event_vote_1,@event_vote_2,@event_vote_3].max
        @event.final_date = @event.date1
        @event.save
      elsif @event_vote_2 = [@event_vote_1,@event_vote_2,@event_vote_3].max
        @event.final_date == @event.date2
        @event.save
      elsif @event_vote_3 = [@event_vote_1,@event_vote_2,@event_vote_3].max
        @event.final_date == @event.date3
        @event.save
      end
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @user_creator = RegisteredUser.find(current_registered_user.id)
    @organizations = Organization.joins(:organization_admins).where(organization_admins: {admin_id: current_registered_user.id})
  end

  # GET /events/1/edit
  def edit
  end

  def upload_files
    @event = Event.find(params[:event_id])
  end

  def images
    @event = Event.find(params[:event_id])
  end

  def videos
    @event = Event.find(params[:event_id])
  end

  def pdf
    @event = Event.find(params[:event_id])
  end

  def remove
    @event = params[:event_id]
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        @event_guest = EventGuest.new
        @event_guest.event_id = @event.id
        @event_guest.registered_user_id = @event.event_creator_id
        @event_guest.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to new_event_path, alert: 'Required fields not completed' }
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: "The event - " + @event.title + " - was deleted"
  end

  def create_comment
    if params[:type] == "reply"
      @reply = Reply.new(text: params[:text])
      @reply.registered_user_id = current_registered_user.id
      @reply.profile_picture = "j"
      @reply.comment_id = params[:comment_id]

      if @reply.save
        print("Success")
      else
        print("Error")
      end
    else
      @comment = Comment.new(text: params[:text])
      @comment.registered_user_id = current_registered_user.id
      @comment.profile_picture = "j"
      @comment.event_id = params[:events_id]

      if @comment.save
        print("Success")
      else
        print("Error")
      end
    end

    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title,:description,:location,:final_date,:date_rule,:visibility, :date1, :date2, :date3, :organization_id,:event_creator_id,:bannerEvent,:number_of_voters,imgEvent: [],videosEvent: [],pdfEvent: [])
    end
end
