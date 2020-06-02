class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    #@events = Event.all
    @events_created = Event.where(event_creator_id: 1)
    @events_joined = Event.joins(:event_guests).where(event_guests:{registered_user_id: 1})
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event_comments = Comment.joins(:event).where(event_id: params[:id]).joins(:registered_user)
    @comment_replies = Reply.joins(:comment).where(comment_id: @event_comments)
    @event_images = EventImage.joins(:event).where(event_id: params[:id])
    @event_videos = EventVideo.joins(:event).where(event_id: params[:id])
    @event_pdfs = EventPdf.joins(:event).where(event_id: params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    @user_creator = RegisteredUser.all.limit(1)
    @organizations = Organization.joins(:organization_admins).where(organization_admins: {admin_id: 1})
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
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
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
    redirect_to events_path
  end

  def create_comment
    @comment = Comment.new(text: params[:text])
    @comment.registered_user_id = 1
    @comment.profile_picture = "j"
    @comment.event_id = params[:events_id]

    if @comment.save
      print("Success")
    else
      print("Error")
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
      params.fetch(:event, {}).permit(:title,:description,:location,:final_date,:date_rule,:visibility,:organization_id,:event_creator_id,:bannerEvent,imgEvent: [],videosEvent: [],pdfEvent: [])
    end
end
