class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
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
    #@comment = Comment.new(comment_params)

    #respond_to do |format|
    # if @comment.save
    #   format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #   format.json { render :show, status: :created, location: @comment }
    # else
    #   format.html { render :new }
    #   format.json { render json: @comment.errors, status: :unprocessable_entity }
    # end
    #end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.update(comment_params)
    redirect_to event_path(@comment.event)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.fetch(:comment, {}).permit(:text)
  end
end