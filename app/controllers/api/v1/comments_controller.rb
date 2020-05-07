class API::V1::CommentsController < APIController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    @comments = Comment.where(event_id: params[:event_id])
    render json: @comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render json: @comment
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    render json: @comment
  end

  # GET /comments/1/edit
  def edit
    render json: @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :show, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render :show, status: :ok, location: api_v1_event_comment_path(@comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:id, :profile_picture, :text ,:image ,:registered_user_id ,:event_id)
    end
end
