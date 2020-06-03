class Admin::EventsController < AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @users = RegisteredUser.all
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
    @user_creator = RegisteredUser.all
    @organizations = Organization.all
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      @event_guest = EventGuest.new
      @event_guest.event_id = @event.id
      @event_guest.registered_user_id = @event.event_creator_id
      @event_guest.save
      redirect_to admin_event_path(@event.id)
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event.update(event_params)
    redirect_to admin_event_path(@event.id)
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:title,:description,:location,:final_date,:date_rule,:visibility, :date1, :date2, :date3, :organization_id,:event_creator_id,:bannerEvent,imgEvent: [],videosEvent: [],pdfEvent: [])
    end
end
