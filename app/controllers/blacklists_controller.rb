class BlacklistsController < ApplicationController
  before_action :set_blacklist, only: [:show, :edit, :update, :destroy]

  # GET /blacklists
  # GET /blacklists.json
  def index
    @blacklists = Blacklist.all
  end

  # GET /blacklists/1
  # GET /blacklists/1.json
  def show
  end

  # GET /blacklists/new
  def new
    @blacklist = Blacklist.new
    @reported_type = params[:reported_type]
    @r = @reported_type
    if @reported_type = "event"
      @reported = Event.find(params[:reported_id])
    elsif @reported_type = "organization"
      @reported = Organization.find(params[:reported_id])
    elsif @reported_type = "user"
      @reported = RegisteredUser.find(params[:reported_id])
    end
  end

  # GET /blacklists/1/edit
  def edit
  end

  # POST /blacklists
  # POST /blacklists.json
  def create
    @blacklist = Blacklist.new(reported_type: params[:blacklist][:reported_type],reported_id: params[:blacklist][:reported_id],user_report_id: params[:blacklist][:user_report], message: params[:blacklist][:message])

    if @blacklist.save
      if @blacklist.reported_type = "event"
        redirect_to event_path(@blacklist.reported_id)
      elsif @blacklist.reported_type = "organization"
        redirect_to organization_path(@blacklist.reported_id)
      elsif @blacklist.reported_type = "user"
        redirect_to user_profile_path(@blacklist.reported_id)
      end
    end
  end

  # PATCH/PUT /blacklists/1
  # PATCH/PUT /blacklists/1.json
  def update
    respond_to do |format|
      if @blacklist.update(blacklist_params)
        format.html { redirect_to @blacklist, notice: 'Blacklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @blacklist }
      else
        format.html { render :edit }
        format.json { render json: @blacklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blacklists/1
  # DELETE /blacklists/1.json
  def destroy
    @blacklist.destroy
    respond_to do |format|
      format.html { redirect_to blacklists_url, notice: 'Blacklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blacklist
      @blacklist = Blacklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blacklist_params
      params.fetch(:blacklist, {}).permit(:reported_type,:reported_id,:user_report_id,:message)
    end
end
