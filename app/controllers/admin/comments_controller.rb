class Admin::CommentsController < AdminController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @users = RegisteredUser.all
    @events = Event.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment_replies = Reply.joins(:comment).where(comment_id: @comment.id)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(text: params[:text])
    @comment.registered_user_id = 1
    @comment.profile_picture = "j"
    @comment.event_id = params[:event_id]

    if @comment.save
      print("Success")
    else
      print("Error")
    end

    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.update(text: params[:comment][:text])
    redirect_to admin_comments_path
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to admin_comments_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {})
    end
end
