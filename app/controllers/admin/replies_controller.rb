class Admin::RepliesController < AdminController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @reply = Reply.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @reply.update(text: params[:reply][:text])
    redirect_to admin_comments_path, notice: 'Reply was successfully updated.'
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @reply.destroy
    redirect_to admin_comments_path,notice: 'Reply was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

  # Only allow a list of trusted parameters through.
  def reply_params
    params.fetch(:reply, {})
  end
end

